import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClockCountDown extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CLockCountDown();
  }
}
class _CLockCountDown extends State<ClockCountDown>{
  Timer _timer;
  int hourtime,minutestime,secondstime,total_time;
  DateTime endtime;
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    endtime=DateTime.now().add(Duration(minutes: 90));
    total_time = 2;
    super.initState();
  }

  void startTimer(){

    const oneSec = const Duration(seconds: 1);
    Timer.periodic(oneSec,(Timer timer) {
          hourtime= endtime.hour - DateTime.now().hour;
          minutestime= endtime.minute - DateTime.now().minute;
          secondstime= endtime.second - DateTime.now().second;
          if(total_time<1){
            timer.cancel();
          }
          else{
            total_time=hourtime*3600+minutestime*60+secondstime;
          }
          setState(() {

          });
        }

    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    startTimer();
    return Container(
      child: total_time<1?Text("Kết thúc",style: GoogleFonts.roboto(color: Colors.red)):Text("Còn lại: ${total_time} phút",style: GoogleFonts.roboto(color: Colors.red),),
    );
  }
}