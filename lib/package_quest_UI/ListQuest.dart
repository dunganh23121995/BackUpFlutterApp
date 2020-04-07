import 'package:flutter/cupertino.dart';
import 'package:testappflutter/package_quest_UI/Question.dart';

class ListQuest{
  final children = <Widget>[];
 final VoidCallback fOnchange;
  ListQuest({this.fOnchange}){
    for(var i=0;i<=10;i++){
      children.add(new MyQuestionUI(onChange: fOnchange,));
    }
  }
  List<Widget> getListQuest(){
    return children;
  }
}


