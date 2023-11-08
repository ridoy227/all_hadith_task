import 'package:al_hadith/data/book_model.dart';
import 'package:al_hadith/database_helper/database_helper.dart';
import 'package:get/get.dart';

class HomeController extends GetxController implements GetxService{
  DatabaseHelper databaseHelper;
  HomeController({required this.databaseHelper});

  List<BookModel> bookList = [];


  Future<void> getBookData() async {
    await databaseHelper.initDatabase();
    final List<Map<String, dynamic>> results = await  databaseHelper.db!.query("books");
    for(var row in results){
      bookList.add(BookModel(
        title: row['title'].toString(),
        avbrCode: row['abvr_code'].toString(),
        bookName:row['book_name'].toString(),
        totalHadith: row['number_of_hadis'].toString(),
        color: row['color_code'].toString(),
      ));
    }
    update();
  }


}