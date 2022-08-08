import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  //Padrão Singleton
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;
  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = await getDatabasesPath();
    String pathWithName = '$path/database.db';

    return await openDatabase(
      pathWithName,
      version: 1,
      onCreate: onCreateTable,
    );
  }

  //Method to create the table on oncreate
  
  Future onCreateTable(Database db, int version) async {
    await db.execute(
      'create table texts (id integer primary key autoincrement, title text, body text)',
    );
  }

  //CRUD Methods

  Future<int> insertText(String text) async {
    Database db = await instance.database;
    return db.insert('texts', {'title': text});
  }

  Future<String> getText() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> response = await db.query('texts');
    if (response.isNotEmpty) {
      return response.last['title'];
    } else {
      return 'Nenhum dado encontrado';
    }
  }
}
