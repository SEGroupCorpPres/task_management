import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_management/features/data/local/models/task.dart';

class TaskRepositoryImpl {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'task_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks (
        id INTEGER,
        title TEXT,
        description TEXT,
        date INTEGER,
        address TEXT,
        status TEXT,
        category TEXT,
        isNotify INTEGER
      )
    ''');
  }

  Future<int> createTask(Task task) async {
    final db = await database;
    return await db.insert('tasks', task.toMap());
  }

  Future<List<Task>> getTasks() async {
    final db = await database;
    final result = await db.query('tasks');

    return result.map((map) => Task.fromJson(map)).toList();
  }

  Future<Task?> getTaskById(int id) async {
    final db = await database;
    final result = await db.query('tasks', where: 'id = ?', whereArgs: [id], limit: 1);
    if (result.isNotEmpty) {
      return Task.fromJson(result.first);
    } else {
      return null;
    }
  }

  Future<List<Task>> getTaskByCategory(String category) async {
    final db = await database;
    final result = await db.query('tasks', where: 'category = ?', whereArgs: [category]);
    return result.map((task) => Task.fromJson(task)).toList();
  }

  Future<int> updateTask(Task task) async {
    final db = await database;
    return await db.update('tasks', task.toMap(), where: 'id = ?', whereArgs: [task.id]);
  }

  Future<int> deleteTask(int id) async {
    final db = await database;
    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
