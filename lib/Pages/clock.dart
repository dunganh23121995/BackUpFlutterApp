import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:testappflutter/database/my_sqlite.dart';
import 'package:testappflutter/database/questDB.dart';

class ClockCountDown extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CLockCountDown();
  }
}
class _CLockCountDown extends State<ClockCountDown>{
static bool statusload;
List<Quest> listquest;
MyDatabaseHelp _myDatabaseHelp;

void _getListQuest() async{
  if(listquest==null) listquest=new List();
  if(_myDatabaseHelp==null) _myDatabaseHelp = new MyDatabaseHelp();
  List<Map<String,dynamic>> list= await _myDatabaseHelp.getListQuestAll();
  if(list!=null)
  list.forEach((f){
    Quest tmp = new Quest();
    tmp.getObjQuestFromMap(f);
    listquest.add(tmp);
    setState(() {
      statusload=true;
    });
  });

}


  @override
  void initState() {
 statusload=false;
 _getListQuest();
  }

  @override
  Widget build(BuildContext context){
    // TODO: implement build

    return Scaffold(
      body: Center(
        child: statusload!=true?Text("Đợi xíu nào!"):
            ListView.builder(itemBuilder: (context,index){
             return Text(listquest[index].contentQuest);
            },
              itemCount: listquest.length,
            ),
      ),
    );
  }

Future<String> loadDataToPath(String path) async{
    return await rootBundle.loadString(path);
}







}