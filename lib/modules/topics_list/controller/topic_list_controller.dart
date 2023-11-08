import 'package:al_hadith/data/chapter_model.dart';
import 'package:al_hadith/database_helper/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopicListController extends GetxController implements GetxService{
  DatabaseHelper databaseHelper;
  TopicListController({required this.databaseHelper});

  TextEditingController searchController = TextEditingController();


  List<ChapterModel> chapterList = [];
  List<ChapterModel> filterData = [];

  Future<void> getChapterByBookName(String bookName) async {
    await databaseHelper.initDatabase();
    chapterList = [];
    final List<Map<String, dynamic>> results = await  databaseHelper.db!.query("chapter");
    for(var row in results){
      if(row["book_name"] == bookName){
        chapterList.add(
            ChapterModel(
              title: row["title"].toString(),
              range: row["hadis_range"].toString(),
              number: row["number"].toString(),
            )
        );
      }
    }
    update();
  }


  void searchChapter(String chapterName){
    filterData = [];
    for(var item in  chapterList){
      if(item.title.contains(chapterName)){
        filterData.add(item);
      }
    }
    update();
  }



}