import 'dart:core';
import 'package:testappflutter/Practice/group_field.dart';



class Achievement{
  DateTime timeend_exam;
  String title_specialize;
  String type_exammination;
  int result_success;
  int result_fail;
  int resullt_null;
  Achievement(DateTime timeend_exam, String title_specialize, String type_exammination,int result_success, int result_fail, int resullt_null){
    this.timeend_exam=timeend_exam;
    this.title_specialize=title_specialize;
    this.type_exammination=type_exammination;
    this.result_success=result_success;
    this.result_fail=result_fail;
    this.resullt_null=resullt_null;
  }
  

}
