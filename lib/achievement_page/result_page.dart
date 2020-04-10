import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testappflutter/achievement_page/intity_result.dart';
import 'package:testappflutter/achievement_page/style/timeline.dart';
import 'package:testappflutter/achievement_page/style/timeline_model.dart';
import 'package:testappflutter/app_theme.dart';

class ResultExamPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new _ResultExamPage();
  }

}


class _ResultExamPage extends State<ResultExamPage>{
  List<Achievement> list_ach;
  List<TimelineModel> items;
  double width_a_part;
  _ResultExamPage({List<Achievement> list_ach}){
    list_ach==null? this.list_ach= new List<Achievement>():this.list_ach=list_ach;
    items= new List();
  }
  Widget _an_achievement({Achievement achievement}){
    int _sum = achievement.resullt_null+achievement.result_fail+achievement.result_success;
    width_a_part = (MediaQuery.of(context).size.width)/(_sum);
    int _result_success = (achievement.result_success*100/_sum).toInt();
    return  Container(
      margin: EdgeInsets.only(bottom: 10.0,top: 10.0),
      padding: EdgeInsets.fromLTRB(8,8,8,8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        boxShadow: [BoxShadow(color: Colors.grey,offset: Offset(2.0,2.0))],
        color: achievement.is_pass_exam?AppTheme.yellow_background3:Colors.white.withAlpha(150),
      ),
      child: Column(
        children: <Widget>[
          Center(child: Text(achievement.title_specialize,style: TextStyle(fontWeight: FontWeight.w500),),),
          Center(child: Text(achievement.type_exammination,style: TextStyle(fontWeight: FontWeight.w300),),),
          Align(alignment: Alignment.centerLeft,child: Text("Điểm thi: ${_result_success}/100",style: TextStyle(fontWeight: FontWeight.w200),),),
          Align(alignment: Alignment.centerLeft,child: Text("Kết quả: "+(achievement.is_pass_exam?"Đạt":"Không Đạt"),style: TextStyle(fontWeight: FontWeight.w200),),),
          Container(
            padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
            child: Row(
              children: <Widget>[
                Icon(Icons.done,color: Colors.green,size: 12,),
                Container(
                  alignment: Alignment.center,
                  width: achievement.result_success*width_a_part,
                  color: Colors.green,
                  child: Text(achievement.result_success.toString()),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
            child: Row(
              children: <Widget>[
                Icon(Icons.clear,color: Colors.red,size: 12,),
                Container(
                  alignment: Alignment.center,
                  width: achievement.result_fail*width_a_part,
                  color: Colors.red,
                  child: Text(achievement.result_fail.toString()),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
            child: Row(
              children: <Widget>[
                Icon(Icons.help,color: Colors.grey,size: 12,),
                Container(
                  alignment: Alignment.center,
                  width: achievement.resullt_null*width_a_part,
                  color: Colors.grey,
                  child: Text(achievement.resullt_null.toString()),
                ),
              ],
            ),
          ),

          Align(alignment: Alignment.bottomRight,child: Text(achievement.timeend_exam.toString(),style: TextStyle(fontWeight: FontWeight.w200),),),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    list_ach.add(Achievement(is_passexam: true));
    list_ach.add(Achievement(is_passexam: false));
    list_ach.add(Achievement(is_passexam: true));
    list_ach.add(Achievement(is_passexam: true));
    list_ach.add(Achievement(is_passexam: false));
    list_ach.add(Achievement(is_passexam: true));
    list_ach.add(Achievement(is_passexam: true));
    list_ach.add(Achievement(is_passexam: false));
    list_ach.add(Achievement(is_passexam: true));

    list_ach.forEach((element){
      items.add(TimelineModel(
          _an_achievement(achievement: element),
          position: TimelineItemPosition.random,
          iconBackground: Colors.white,
          icon: Icon(Icons.mode_edit,color: Colors.purpleAccent,)));
    });




    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Thành Tựu"),
          centerTitle: true,
          backgroundColor: Colors.green.withOpacity(0.25),
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
            },icon: Icon(Icons.arrow_back),),
        ),
        body:Timeline(children: items,position: TimelinePosition.Left,)
      ),
    );
  }



}