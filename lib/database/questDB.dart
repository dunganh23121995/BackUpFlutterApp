
import 'package:testappflutter/package_quest_UI/Question.dart';

class Quest {
  String contentQuest,result_contentA,result_contentB,result_contentC,result_contentD;
  int numberquest,resultSuccess;
  Quest({this.contentQuest, this.result_contentA, this.result_contentB,
      this.result_contentC, this.result_contentD, this.numberquest,
      this.resultSuccess});

  void setQuest(numberquest,contentquest,result_contentA,result_contentB,result_contentC,result_contentD,resultSuccess){
    this.numberquest=numberquest;
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
    resultSuccess.toInt();
    if(compareResultToInt(resultChoose)==resultSuccess)
    return true;
    else return false;
  }
}