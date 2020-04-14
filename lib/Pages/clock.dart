import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

class ClockCountDown extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CLockCountDown();
  }
}
class _CLockCountDown extends State<ClockCountDown>{
  List<String> list;
  bool start;
  String file;
  @override
  void initState() {
    start=false;


  }

  @override
  Widget build(BuildContext context){
    // TODO: implement build
    if(list==null){
      list=new List();
      String path = "assets/allsourcedata/test.txt";
      loadDataToPath(path).asStream().forEach((value){
        list.add(value);
        start=true;
        setState(() {

        });
      });

    }


    return Scaffold(
      body: Center(
        child: start==true?Text(list[0].toString()):("Chua hoan thanh"),
      ),
    );
  }

Future<String> loadDataToPath(String path) async{
    return await rootBundle.loadString(path);
}







}