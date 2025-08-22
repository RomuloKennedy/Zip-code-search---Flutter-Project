import 'package:busca_cep/app/config/local_database.dart';
import 'package:busca_cep/app/domain/models/language.dart';

class LanguageRepository {
  final LocalDatabase localDatabase;
  LanguageRepository({required this.localDatabase});

  Future<Language> getLanguage() async {
    var languageDatabase = (await localDatabase.localDB.query('Language'));
    try {
      Language language = Language.fromJsonSQFlite(languageDatabase.first);
      return language;
    } catch (e) {
      Language language = Language(tag: "pt-BR");
      await insertTagLanguage(language);      
      return language;
    }
  }

  updateTagLanguage(Language language) async {
    try {
      Language languageDb = await getLanguage();

      await localDatabase.localDB.update('Language', language.toJsonSQFlite(),
          where: 'tag = ?', whereArgs: [languageDb.tag]);
    } catch (e) {
      insertTagLanguage(language);
    }
  }

  insertTagLanguage(Language language) async {
    await localDatabase.localDB.insert('Language', language.toJsonSQFlite());
  }
}
