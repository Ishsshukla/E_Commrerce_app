// import 'dart:async';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import '../models/product.dart';

// class DBHelper {
//   static final DBHelper _instance = DBHelper._internal();
//   factory DBHelper() => _instance;

//   DBHelper._internal();

//   static Database? _database;

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, 'products.db');

//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute('''
//           CREATE TABLE products(
//             id INTEGER PRIMARY KEY,
//             title TEXT,
//             description TEXT,
//             price REAL,
//             imageUrl TEXT,
//             category TEXT
//           )
//         ''');
//       },
//     );
//   }

//   Future<void> insertProducts(List<Product> products) async {
//     final db = await database;
//     for (var product in products) {
//       await db.insert(
//         'products',
//         product.toMap(),
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     }
//   }

//   Future<List<Product>> getProducts() async {
//     final db = await database;
//     final maps = await db.query('products');

//     return List.generate(
//       maps.length,
//       (i) => Product(
//         id: maps[i]['id'],
//         title: maps[i]['title'],
//         description: maps[i]['description'],
//         price: maps[i]['price'],
//         imageUrl: maps[i]['imageUrl'],
//         category: maps[i]['category'],
//       ),
//     );
//   }
// }
