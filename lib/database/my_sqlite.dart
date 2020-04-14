import 'dart:core';
import 'dart:core';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testappflutter/Pages/quest_list.dart';
import 'package:testappflutter/Practice/group_field.dart';




class MyDatabaseHelp{

  static MyDatabaseHelp _myDatabaseHelp;
  static Database _database;

  List<String> _tblQuestSpecialize=["tbl_ksdh","tbl_ksdcct","tbl_tkqhxd","tbl_tkktct","tbl_tkkcctddcn","tbl_tkcdct",
  "tbl_tkctnct","tbl_tkxdctgt","tbl_tkxdctnnvptnt","tbl_tkxdcthtkt","tbl_gsctddcnvhtkt","tbl_gsctgt","tbl_gsctnnvptnt","tbl_gsldtbvct",
    "tbl_dgxd","tbl_qldadtxd"];
  List<String>  _tblQuestField = ["tbl_ksxd","tbl_tkqhxd","tbl_tkxd","tbl_gstcxd","tbl_dgxd","tbl_qldadtxd"];
  String _tblAll = "tbl_all";
  String _colQuest="contentquest",_colRA="contentresulta",_colRB="contentresultb",_colRC="contentresultc",
      _colRD="contentresultd",_colsuccess="resultsuccess",_colid="id";

  factory MyDatabaseHelp(){
      if(_myDatabaseHelp==null){
        _myDatabaseHelp=MyDatabaseHelp._Init();
      }
      return _myDatabaseHelp;
  }

  _onCreateDb( Database db, int version) async{
    //Khởi tạo bảng câu hỏi chuyên môn
    for(int i = 0; i<_tblQuestSpecialize.length;i++)
      await db.execute('create table ${_tblQuestSpecialize[i]}($_colid INTEGER PRIMARY KEY AUTOINCREMENT, $_colQuest TEXT,$_colRA TEXT,$_colRB TEXT,$_colRC TEXT,$_colRD TEXT,$_colsuccess TEXT)');
    //Khởi tạo bảng câu hỏi lĩnh vực
    for(int i = 0;i<_tblQuestField.length;i++)
      await db.execute('create table ${_tblQuestField[i]}($_colid INTEGER PRIMARY KEY AUTOINCREMENT, $_colQuest TEXT,$_colRA TEXT,$_colRB TEXT,$_colRC TEXT,$_colRD TEXT,$_colsuccess TEXT)');
    //Khởi tạo bảng câu hỏi chung
    await db.execute('create table ${_tblAll}($_colid INTEGER PRIMARY KEY AUTOINCREMENT, $_colQuest TEXT,$_colRA TEXT,$_colRB TEXT,$_colRC TEXT,$_colRD TEXT,$_colsuccess TEXT)');
  }

  Future<Database> initializeDatabase() async{
    Directory dir = await getApplicationDocumentsDirectory();
    String path=dir.path+"mydatabase.db";
      var database = await openDatabase(path,onCreate: _onCreateDb);
      return database;
  }

  Future<Database> get database async{
      if(_database==null)
        _database= await initializeDatabase();
      return _database;
  }

  MyDatabaseHelp._Init();



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