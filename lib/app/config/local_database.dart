import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase{
  late Database localDB;

    Future<bool> initLocalDB() async {
    localDB = await _initLocalDB();

    return true;
  }
    Future<Database> _initLocalDB() async {
    // Carrega o banco de dados, caso o banco não exista, o banco será criado
    final pathDB = await getDatabasesPath();
    return openDatabase(join(pathDB, "buscaCep.db"),
        onCreate: (database, version) async {
      await database.execute("""
            CREATE TABLE IF NOT EXISTS Language(
            tag TEXT PRIMARY KEY                                                         
            )
            """);        
    }, version: 1);
  }

}