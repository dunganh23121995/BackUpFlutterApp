import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testappflutter/Practice/group_field.dart';
import 'package:testappflutter/achievement_page/intity_result.dart';

class ResultExamPage extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new _ResultExamPage();
  }

}


class _ResultExamPage extends State<ResultExamPage>{

  List<Achievement> list_ach;

  @override
  void initState() {
    list_ach = new List();
    list_ach.add( new Achievement(DateTime.now(),list_Specialize[TYPEPRACTICE.ks_diahinh],list_type_examination[TYPE_EXAMINATION.notspecialize],20,30,20));
    list_ach.add( new Achievement(DateTime.now(),"Loại Chuyên Môn1","Kiểu thi sát hạch1",20,30,20));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "title",
      home: Scaffold(
        body: Center(
          child: Text("some things"),
        ),
      ),
    );
  }

}