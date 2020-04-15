import 'dart:core';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testappflutter/Pages/quest_list.dart';
import 'package:testappflutter/Practice/group_field.dart';
import 'package:testappflutter/database/AllListQuestToInsert/quest_field_ksxd.dart';
import 'package:testappflutter/database/AllListQuestToInsert/quest_public.dart';
import 'package:testappflutter/database/questDB.dart';




class MyDatabaseHelp{

  static MyDatabaseHelp _myDatabaseHelp;
  static Database _database;
//********* NAME TABLE AND NAME COLUMN****************************//
  List<String> _tblQuestSpecialize=["tbl_ksdh","tbl_ksdcct","tbl_tkqhxdspec",
    "tbl_tkktct","tbl_tkkcctddcn","tbl_tkcdct", "tbl_tkctnct","tbl_tkxdctgt",
    "tbl_tkxdctnnvptnt","tbl_tkxdcthtkt","tbl_gsctddcnvhtkt", "tbl_gsctgt",
    "tbl_gsctnnvptnt","tbl_gsldtbvct", "tbl_dgxdspec","tbl_qldadtxdspec"];

  List<String>  _tblQuestField = ["tbl_ksxd","tbl_tkqhxdfield","tbl_tkxd",
    "tbl_gstcxd","tbl_dgxdfield","tbl_qldadtxdfield"];

  String _tblAll = "tbl_all",_tbl_Achi="tbl_achievement";

  String _colQuest='contentquest',_colRA='contentresulta',_colRB='contentresultb',_colRC='contentresultc',
      _colRD='contentresultd',_colsuccess='resultsuccess',_colid='id';

  String _coltitle="titlespecialize",_coltype="typeexammination",_colsuc="resultsuccess",_colfail="resultfail",_colnull="resulltnull",_colpass="ispassexam";


  //*******************FUNCTION***************************//
  factory MyDatabaseHelp(){
      if(_myDatabaseHelp==null){
        _myDatabaseHelp=MyDatabaseHelp._Init();
      }
      return _myDatabaseHelp;
  }
  MyDatabaseHelp._Init();
  Future<Database> initializeDatabase() async{
    Directory dir = await getApplicationDocumentsDirectory();
    String path=dir.path+"mydatabase.db";
    var database = await openDatabase(path,onCreate: _onCreateDb,version: 1);
    return database;
  }
  Future<Database> get database async{
    if(_database==null)
      _database= await initializeDatabase();
    return _database;
  }

  _onCreateDb( Database db, int version) async{
    //Khởi tạo bảng câu hỏi chuyên môn
    for(int i = 0; i<_tblQuestSpecialize.length;i++)
      await db.execute('create table ${_tblQuestSpecialize[i]}($_colid INTEGER PRIMARY KEY AUTOINCREMENT, $_colQuest TEXT,$_colRA TEXT,$_colRB TEXT,$_colRC TEXT,$_colRD TEXT,$_colsuccess TEXT);');
    //Khởi tạo bảng câu hỏi lĩnh vực
    for(int i = 0;i<_tblQuestField.length;i++)
       await db.execute('create table ${_tblQuestField[i]}($_colid INTEGER PRIMARY KEY AUTOINCREMENT, $_colQuest TEXT,$_colRA TEXT,$_colRB TEXT,$_colRC TEXT,$_colRD TEXT,$_colsuccess TEXT);');
    //Khởi tạo bảng câu hỏi chung
       await db.execute('create table ${_tblAll}($_colid INTEGER PRIMARY KEY AUTOINCREMENT, $_colQuest TEXT,$_colRA TEXT,$_colRB TEXT,$_colRC TEXT,$_colRD TEXT,$_colsuccess TEXT);');
    // Khởi tạo bảng kết quả
       await db.execute('create table $_tbl_Achi($_colid INTEGER PRIMARY KEY AUTOINCREMENT,$_coltitle TEXT,$_coltype TEXT,$_colsuc INTEGER,$_colfail INTEGER,$_colnull INTEGER, $_colpass BOOLEAN);');


    //****************************************************//
    // Insert dữ liệu vào database cho duy nhất 1 lần mở ứng dụng, những lần sau không thực hiện lại thao tác này
    Quest quest;
    //insert vào table câu hỏi chung
    for(int i=0;i<list_quest_All.length;i+=6) {
      quest = new Quest(
        contentQuest: list_quest_All[i],
        result_contentA: list_quest_All[i + 1],
        result_contentB: list_quest_All[i + 2],
        result_contentC: list_quest_All[i + 3],
        result_contentD: list_quest_All[i + 4],
        resultSuccess: list_quest_All[i + 5],
      );
      await db.insert(_tblAll, quest.toMap());
    }

    //Insert vào các table lĩnh vực - nhóm
      //1 bảng ksxd
    for(int i=0;i<list_field_ksxd.length;i+=6) {
      quest = new Quest(
        contentQuest: list_field_ksxd[i],
        result_contentA: list_field_ksxd[i + 1],
        result_contentB: list_field_ksxd[i + 2],
        result_contentC: list_field_ksxd[i + 3],
        result_contentD: list_field_ksxd[i + 4],
        resultSuccess: list_field_ksxd[i + 5],
      );
      await db.insert(_getNameTableField(TYPEPRACTICE.ks_diahinh), quest.toMap());
    }

    //Insert vào các table chuyên môn riêng

  }


  //Thêm sửa xóa lấy dữ liệu bảng câu hỏi chung
  Future<List<Map<String,dynamic>>> getListQuestAll() async{
    Database db = await this.database;
     var _result= await db.query(_tblAll,orderBy: _colid);
  return _result;
  }
  Future<int> countTableAll(String tblename) async{
    Database db = await database;
    List<Map<String,dynamic>> sql = await db.rawQuery("Select count(*) from $tblename");
    int number= await Sqflite.firstIntValue(sql);
    return number;
  }
  Future<int> insertTblQuestAll(Quest values) async{
    Database db = await database;
    return await db.insert(_tblAll,values.toMap());
  }
  Future<int> deleteTblQuestAll({int id}) async{
   Database db =  await database;
   int a;
   id!=null?
   a = await db.delete(_tblAll,where: '$_colid=?',whereArgs: [id]):
    a = await   db.delete(_tblAll);
   return a;
  }
  Future<int> updateTbkQuestAll(Quest values) async{
    Database db =  await database;
    return await db.update(_tblAll, values.toMap(),where: '$_colid=?',whereArgs: [values.toMap()['id']]);
  }

  //Thêm sửa xóa lấy dữ liệu các bảng câu hỏi theo Chuyên môn
  Future<List<Map<String, dynamic>>> getTableSpecialize(TYPEPRACTICE typetablename) async{
    Database db =  await database;
    String nametbl = _getNameTableSpec(typetablename);
    return await db.query(nametbl,orderBy: _colid);
  }
  Future<int> countTableSpec(TYPEPRACTICE typetablename)async{
    Database db =  await database;
    String nametbl = _getNameTableSpec(typetablename);
     var result= await db.rawQuery('Select count(*) from $nametbl');
     return await Sqflite.firstIntValue(result);
  }
  Future<int> insertTableSpec(TYPEPRACTICE typetablename,Quest obj)async{
  Database db = await database;
  return await db.insert(_getNameTableSpec(typetablename), obj.toMap());
  }
  Future<int> deleteTableSpec(TYPEPRACTICE typetablename,{int id}) async{
    Database db =await database;
    int result;
    id!=null?
      result= await db.delete(_getNameTableSpec(typetablename),where:'$_colid=?',whereArgs: [id]):
      result = await db.delete(_getNameTableSpec(typetablename));
    return result;
  }
  Future<int> updateTableSpec(TYPEPRACTICE typetablename,Quest obj)async{
    Database db = await database;
    return await db.update(_getNameTableSpec(typetablename), obj.toMap(),where: '$_colid=?',whereArgs: [obj.id]);
  }
  //Thêm sửa xóa lây dữ liệu các bảng câu hỏi theo Lĩnh vực
  Future<List<Map<String, dynamic>>> getTableField(TYPEPRACTICE typetablename) async{
    Database db = await database;
    return await db.query(_getNameTableField(typetablename),orderBy: _colid);
  }
  Future<int> countTableField(TYPEPRACTICE typetablename) async{
    Database db =  await database;
    String nametbl = _getNameTableField(typetablename);
    var result= await db.rawQuery('Select count(*) from $nametbl');
    return await Sqflite.firstIntValue(result);
  }
  Future<int> deleteTableField(TYPEPRACTICE typetablename,{int id}) async{
    Database db =await database;
    int result;
    id!=null?
    result= await db.delete(_getNameTableField(typetablename),where:'$_colid=?',whereArgs: [id]):
    result = await db.delete(_getNameTableField(typetablename));
    return result;
  }
  Future<int> updateTableField(TYPEPRACTICE typetablename,Quest obj)async{
    Database db = await database;
    return await db.update(_getNameTableField(typetablename), obj.toMap(),where: '$_colid=?',whereArgs: [obj.id]);
  }
  //*************************END********************************************//



  String _getNameTableField(TYPEPRACTICE typepractice){
    switch(typepractice){

      case TYPEPRACTICE.ks_diahinh:
        // TODO: Handle this case.
      case TYPEPRACTICE.ks_congtrinh:
        // TODO: Handle this case.
        return _tblQuestField[0];
        break;
      case TYPEPRACTICE.tk_quyhoachxaydung:
        // TODO: Handle this case.
        return _tblQuestField[1];
        break;
      case TYPEPRACTICE.tk_kientruccongtrinh:
        // TODO: Handle this case.
      case TYPEPRACTICE.tk_ketcaucongtrinh:
        // TODO: Handle this case.
      case TYPEPRACTICE.tk_codiencongtrinh:
        // TODO: Handle this case.
      case TYPEPRACTICE.tk_capthoatnuoccongtrinh:
        // TODO: Handle this case.
      case TYPEPRACTICE.tk_xdctgiaothong:
        // TODO: Handle this case.
      case TYPEPRACTICE.tk_xdctnongnghiepnongthon:
        // TODO: Handle this case.
      case TYPEPRACTICE.tk_xdcthathangkythuat:
        // TODO: Handle this case.
      return _tblQuestField[2];
      break;
      case TYPEPRACTICE.gs_dandungcongnghiep:
        // TODO: Handle this case.
      case TYPEPRACTICE.gs_giaothong:
        // TODO: Handle this case.
      case TYPEPRACTICE.gs_nongnghiepPTNT:
        // TODO: Handle this case.
      case TYPEPRACTICE.gs_lapdatthietbi:
        // TODO: Handle this case.
      return _tblQuestField[3];
      break;
      case TYPEPRACTICE.dgxd_dinhgiaxaydung:
        // TODO: Handle this case.
        return _tblQuestField[4];
        break;
      case TYPEPRACTICE.qldt_quanlyduandautuxd:
        // TODO: Handle this case.
        return _tblQuestField[5];
        break;
    }
  }
  String _getNameTableSpec(TYPEPRACTICE typetable){
    switch(typetable){
      case TYPEPRACTICE.ks_diahinh:
      // TODO: Handle this case.
      return _tblQuestSpecialize[0];
        break;
      case TYPEPRACTICE.ks_congtrinh:
      // TODO: Handle this case.
        return _tblQuestSpecialize[1];
        break;
      case TYPEPRACTICE.tk_quyhoachxaydung:
      // TODO: Handle this case.
        return _tblQuestSpecialize[2];
        break;
      case TYPEPRACTICE.tk_kientruccongtrinh:
      // TODO: Handle this case.
        return _tblQuestSpecialize[3];
        break;
      case TYPEPRACTICE.tk_ketcaucongtrinh:
      // TODO: Handle this case.
        return _tblQuestSpecialize[4];
        break;
      case TYPEPRACTICE.tk_codiencongtrinh:
      // TODO: Handle this case.
        return _tblQuestSpecialize[5];
        break;
      case TYPEPRACTICE.tk_capthoatnuoccongtrinh:
      // TODO: Handle this case.
        return _tblQuestSpecialize[6];
        break;
      case TYPEPRACTICE.tk_xdctgiaothong:
      // TODO: Handle this case.
        return _tblQuestSpecialize[7];
        break;
      case TYPEPRACTICE.tk_xdctnongnghiepnongthon:
      // TODO: Handle this case.
        return _tblQuestSpecialize[8];
        break;
      case TYPEPRACTICE.tk_xdcthathangkythuat:
      // TODO: Handle this case.
        return _tblQuestSpecialize[9];
        break;
      case TYPEPRACTICE.gs_dandungcongnghiep:
      // TODO: Handle this case.
        return _tblQuestSpecialize[10];
        break;
      case TYPEPRACTICE.gs_giaothong:
      // TODO: Handle this case.
        return _tblQuestSpecialize[11];
        break;
      case TYPEPRACTICE.gs_nongnghiepPTNT:
      // TODO: Handle this case.
        return _tblQuestSpecialize[12];
        break;
      case TYPEPRACTICE.gs_lapdatthietbi:
      // TODO: Handle this case.
        return _tblQuestSpecialize[13];
        break;
      case TYPEPRACTICE.dgxd_dinhgiaxaydung:
      // TODO: Handle this case.
        return _tblQuestSpecialize[14];
        break;
      case TYPEPRACTICE.qldt_quanlyduandautuxd:
      // TODO: Handle this case.
        return _tblQuestSpecialize[15];
        break;
    }
  }

}