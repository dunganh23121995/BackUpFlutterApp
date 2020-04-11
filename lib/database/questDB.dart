
import 'package:flutter/cupertino.dart';
import 'package:testappflutter/Pages/quest_list.dart';

class Quest {
  String contentQuest,result_contentA,result_contentB,result_contentC,result_contentD;
  Result resultSuccess,result_choose;
  Quest({this.contentQuest="Nội dung câu hỏi", this.result_contentA="Đáp án A", this.result_contentB="Đáp án B",
      this.result_contentC="Đáp án C", this.result_contentD="Đáp án D",}){
   if(resultSuccess==null) resultSuccess=Result.A;
   result_choose=Result.nullrs;
  }


  void setQuest(contentquest,result_contentA,result_contentB,result_contentC,result_contentD,resultSuccess){
    this.contentQuest=contentquest;
    this.result_contentA=result_contentA;
    this.result_contentB=result_contentA;
    this.result_contentC=result_contentC;
    this.result_contentD=result_contentD;
  }
  int compareResultToInt(Result obj){
    switch(obj){

      case Result.A:
        // TODO: Handle this case.
      return 1;
        break;
      case Result.B:
        // TODO: Handle this case.
        return 2;

        break;
      case Result.C:
        // TODO: Handle this case.
        return 3;
        break;
      case Result.D:
        // TODO: Handle this case.
        return 4;
        break;
      case Result.nullrs:
        return -1; break;
    }
  }
  bool checkResult(Result resultChoose){
        if(resultChoose==this.resultSuccess){
          return true;
        }else return false;
  }
}