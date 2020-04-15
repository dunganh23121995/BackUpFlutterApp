import 'dart:core';
import 'package:testappflutter/Practice/group_field.dart';

class Achievement {
  int id;
  String timeend_exam;
  String title_specialize;
  String type_exammination;
  int result_success;
  int result_fail;
  int resullt_null;
  bool is_pass_exam;

  Achievement(
      {String timeend_exam,
      String title_specialize = "Tên Chuyên Môn",
      String type_exammination = "Loại Thi",
      int result_success = 0,
      int result_fail = 0,
      int resullt_null = 0,
      bool is_passexam = true}) {
    timeend_exam == null
        ? this.timeend_exam = DateTime.now().toIso8601String()
        : this.timeend_exam = timeend_exam;
    this.title_specialize = title_specialize;
    this.type_exammination = type_exammination;
    this.result_success = result_success;
    this.result_fail = result_fail;
    this.resullt_null = resullt_null;
    this.is_pass_exam = is_passexam;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> tmp = new Map();
    tmp['id'] = this.id;
    tmp['titlespecialize'] = this.title_specialize;
    tmp['typeexammination'] = this.type_exammination;
    tmp['resultsuccess'] = this.result_success;
    tmp['resultfail'] = this.result_fail;
    tmp['resulltnull'] = this.resullt_null;
    tmp['ispassexam'] = this.is_pass_exam;
  }

  Achievement getAchievement(Map<String, dynamic> tmp) {
    this.id = tmp['id'];
    this.title_specialize = tmp['titlespecialize'];
    this.type_exammination = tmp['typeexammination'];
    this.result_success = tmp['resultsuccess'];
    this.result_fail = tmp['resultfail'];
    this.resullt_null = tmp['resulltnull'];
    this.is_pass_exam = tmp['ispassexam'];
  }
}
