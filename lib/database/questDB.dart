
import 'package:flutter/cupertino.dart';
import 'package:testappflutter/Pages/quest_list.dart';

class Quest {
  int id;
  String contentQuest,result_contentA,result_contentB,result_contentC,result_contentD;
  Result resultSuccess,result_choose;

  Quest( this.contentQuest, this.result_contentA, this.result_contentB,
      this.result_contentC, this.result_contentD, this.resultSuccess,
  {this.result_choose=Result.nullrs});

  void setQuest(contentquest,result_contentA,result_contentB,result_contentC,result_contentD,resultSuccess){
    this.contentQuest=contentquest;
    this.result_contentA=result_contentA;
    this.result_contentB=result_contentA;
    this.result_contentC=result_contentC;
    this.result_contentD=result_contentD;

  }

  Map<String,dynamic> toMap(){
    Map<String,dynamic> tmpMap = new Map();
    tmpMap['contentquest']=this.contentQuest;
    tmpMap['contentresulta']=this.result_contentA;
    tmpMap['contentresultb']=this.result_contentB;
    tmpMap['contentresultc']=this.result_contentC;
    tmpMap['contentresultd']=this.result_contentD;
    tmpMap['resultsuccess']=this.result_contentA;
    tmpMap['id']=this.id;
  }
  getObjQuestFromMap( Map<String,dynamic> tmpMap){
    this.contentQuest = tmpMap['contentquest'];
    this.result_contentA= tmpMap['contentresulta'];
    this.result_contentB= tmpMap['contentresultb'];
    this.result_contentC= tmpMap['contentresultc'];
    this.result_contentD= tmpMap['contentresultd'];
    this.resultSuccess = compareStringtoResult(tmpMap['resultsuccess']);
    this.id = tmpMap['id'];
  }

  Result compareStringtoResult(String resultCharater){
    if(resultCharater=='a'||resultCharater=='A') return Result.A;
    if(resultCharater=='b'||resultCharater=='B') return Result.B;
    if(resultCharater=='c'||resultCharater=='C') return Result.C;
    if(resultCharater=='d'||resultCharater=='D') return Result.D;
    return Result.nullrs;

  }

  String compareResultToString(Result obj){
    switch(obj){

      case Result.A:
        // TODO: Handle this case.
      return 'a';
        break;
      case Result.B:
        // TODO: Handle this case.
        return 'b';

        break;
      case Result.C:
        // TODO: Handle this case.
        return 'c';
        break;
      case Result.D:
        // TODO: Handle this case.
        return 'd';
        break;
      case Result.nullrs:
        return null; break;
    }
  }
  bool checkResult(Result resultChoose){
        if(resultChoose==this.resultSuccess){
          return true;
        }else return false;
  }
}
class Achievement{

}