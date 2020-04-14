import 'dart:core';
import 'package:testappflutter/Practice/group_field.dart';



class Achievement{
  DateTime timeend_exam;
  String title_specialize;
  String type_exammination;
  int result_success;
  int result_fail;
  int resullt_null;
  bool is_pass_exam;
  Achievement({DateTime timeend_exam, String title_specialize="Tên Chuyên Môn", String type_exammination="Loại Thi",int result_success=0, int result_fail=0, int resullt_null=0, bool is_passexam=true}){
    timeend_exam==null?timeend_exam=DateTime.now():this.timeend_exam=timeend_exam;
    this.title_specialize=title_specialize;
    this.type_exammination=type_exammination;
    this.result_success=result_success;
    this.result_fail=result_fail;
    this.resullt_null=resullt_null;
    this.is_pass_exam=is_passexam;
  }
  

}
