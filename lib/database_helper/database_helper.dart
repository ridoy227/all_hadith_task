import 'dart:io';

import 'package:al_hadith/data/book_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper extends GetxController implements GetxService {

  List<BookModel> bookList = [];

  Database? db;

  Future<void> initDatabase() async {
    try{
      var databasesPath = await getDatabasesPath();
      var path = join(databasesPath, 'al_hadith.db');
      // Check if the database file exists in the app's data directory
      if (await databaseExists(path)) {
        await openDatabase(path);
      }
      // Create the path to the database in the assets folder
      var dbAssetPath = join('assets/database', 'database.db');
      // Copy the database file from assets to the app's data directory
      ByteData data = await rootBundle.load(dbAssetPath);
      List<int> bytes = data.buffer.asUint8List();
      await File(path).writeAsBytes(bytes);
      db = await openDatabase(path);
    } catch(e){
      if (kDebugMode) {
        print(e);
      }
    }

  }

}