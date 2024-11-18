// import 'package:bts_assignment/Database/Db.dart';
// import 'package:flutter/material.dart';
// import '../models/product.dart';
// // import '../services/db_helper.dart';

// class FavoritesProvider with ChangeNotifier {
//   List<Product> _favorites = [];
//   final DBHelper _dbHelper = DBHelper();

//   List<Product> get favorites => _favorites;

//   Future<void> addFavorite(Product product) async {
//     if (!_favorites.any((p) => p.id == product.id)) {
//       _favorites.add(product);
//       notifyListeners();

//       // Save to SQLite
//       await _dbHelper.insertProducts([product]);
//     }
//   }

//   Future<void> removeFavorite(Product product) async {
//     _favorites.removeWhere((p) => p.id == product.id);
//     notifyListeners();

//     // Remove from SQLite
//     final db = await _dbHelper.database;
//     await db.delete('products', where: 'id = ?', whereArgs: [product.id]);
//   }

//   Future<void> loadFavoritesFromDb() async {
//     _favorites = await _dbHelper.getProducts();
//     notifyListeners();
//   }
// }
