import 'package:busca_cep/app/data/repositories/language_repository.dart';
import 'package:busca_cep/app/domain/models/language.dart';

class LanguageService {
  final LanguageRepository languageRepository;
  late String currentTagLanguage;


  LanguageService({required this.languageRepository});
  final Map<String, String> languageToTag = {
    'Português': 'pt-BR',
    'Inglês': 'en',
    'Español': 'es',
    'हिंदी': 'hi',
    'Bahasa Indonesia': 'id',
    'Русский': 'ru',
    'Tiếng Việt': 'vi',
    'ภาษาไทย': 'th',
    'Türkçe': 'tr',
    'Filipino': 'fil',
  };

  Future<Language> getLanguage()async{
    return await languageRepository.getLanguage();    
  }

  Future<String> getTagLanguage() async {
    String tag = (await languageRepository.getLanguage()).tag;
    currentTagLanguage = tag;
    return tag;
  }

  Future<void> updateTagLanguage(String languageSelect) async {
    Language language = Language(tag: languageToTag[languageSelect]!);
    try {
      await languageRepository.updateTagLanguage(language);
      currentTagLanguage = language.tag;
    } catch (e) {}
  }

  Future<void> insertTagLanguage(String languageSelect) async {
    Language language = Language(tag: languageToTag[languageSelect]!);
    try {
      await languageRepository.insertTagLanguage(language);
    } catch (e) {}
  }
}
