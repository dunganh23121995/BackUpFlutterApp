import 'dart:core';
import 'dart:core';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testappflutter/database/list_string_query.dart';




 class MySqlite {
 static Database database;

 MySqlite(){
  if(database==null){
   init();
  }
 }
void init() async{
 database= await openDatabase(join(await getDatabasesPath(),'quest_prac_database.db'),onCreate: (Database db,int version)async{
  for(int i=0;i<list_query_create_table.length;i++) {
   db.execute(list_query_create_table[i]); //Create 24 table
  }

 });

}

bool insertData(String nameTable,intQuest,String contentQuest, String resultA,String resultB,String resultC,String resultD, int resultSuccess){

 }
 }
