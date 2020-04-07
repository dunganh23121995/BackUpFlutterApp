import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testappflutter/Practice/group_field.dart';
import 'package:testappflutter/app_theme.dart';
import 'package:testappflutter/Pages/quest_list.dart';
import 'package:testappflutter/package_quest_UI/Question.dart';
import 'package:toast/toast.dart';

class ShowQuest extends StatefulWidget{

  ShowQuest({@required this.type_prac_or_exam,@required this.typepractice,@required this.type_examination});
  TYPE_PRAC_OR_EXAM type_prac_or_exam;
  TYPEPRACTICE typepractice;
  TYPE_EXAMINATION type_examination;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SubShowQuest(typepractice: typepractice,type_prac_or_exam: type_prac_or_exam,type_examination: type_examination);
  }
}



class SubShowQuest extends State<ShowQuest> with SingleTickerProviderStateMixin{

  SubShowQuest({this.typepractice,this.type_prac_or_exam, this.type_examination});
  Timer _timer;
  int hourtime=88,minutestime=88,secondstime=88,total_time,daytime,mounthtime,yeartime,bottom_nav_index,count_quest_list,number_quest_now;
  DateTime endDateTime,tmpDateTime;
  Duration tmpDuration;
  TYPE_PRAC_OR_EXAM type_prac_or_exam;
  TYPEPRACTICE typepractice;
  TYPE_EXAMINATION type_examination;
  static bool endTimeExam=false;
  AnimationController _hide;
  @override
  void dispose() {
    _hide.dispose();
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    endTimeExam=false;
    endDateTime = DateTime.now().add(Duration(seconds: 7));
    bottom_nav_index=0;
      _hide = AnimationController(vsync: this,duration: kThemeAnimationDuration);
      count_quest_list=10;
  }
  void startTimer(){
    const oneSec = const Duration(seconds: 1);
    _timer=Timer.periodic(oneSec,(Timer timer) {
      if(endTimeExam){
        timer.cancel();
      }
      else{
          tmpDuration = endDateTime.difference(DateTime.now());
          secondstime = tmpDuration.inSeconds%60;
          minutestime = tmpDuration.inMinutes%60;
          hourtime = tmpDuration.inHours%24;
          if(hourtime==0 && minutestime==0&&secondstime<1){
            endTimeExam=true;
            secondstime=0;
          }
          setState(() {

          });
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    if(type_prac_or_exam==TYPE_PRAC_OR_EXAM.exam)
    startTimer();


    // TODO: implement build
    return NotificationListener<ScrollNotification>(
          onNotification: _handleScrollNotification,
          child: Scaffold(
            body: Container(
              color: Colors.grey.withOpacity(0.25),
              child: Stack(
                children: <Widget>[
                  SizedBox(height: 130,),
                  MyQuestionUI(
                    onChange: () {
                      setState(() {});
                    },
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.grey,offset: Offset(2.0,2.0))],
                        color: AppTheme.white,
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(120))
                    ),
                    child: Stack(children: <Widget>[
                      Align(
                          alignment: Alignment.center,
                          child: endTimeExam==true?Text("Hết Giờ",style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w700,
                              shadows: <Shadow>[Shadow(color: Colors.yellowAccent.withOpacity(0.25),offset: Offset(2.0,2.0),blurRadius: 1.0)],
                              color: Colors.red,fontSize: 25)):
                          Text("${hourtime} : ${minutestime} : ${secondstime}",style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w700,
                              shadows: <Shadow>[Shadow(color: Colors.greenAccent.withOpacity(0.25),offset: Offset(2.0,2.0),blurRadius: 1.0)],
                              color: Colors.red,fontSize: 25),)
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(icon: Icon(Icons.arrow_back,color: Colors.green.withAlpha(225),size: 28,),onPressed: (){
                          Navigator.pop(context);
                        },
                        ),
                      )
                    ],),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: SizeTransition(
              sizeFactor: _hide,
              axisAlignment: -1.0,
              child: BottomNavigationBar(
                unselectedItemColor: Colors.white,
                selectedItemColor: Colors.lightGreen,
                unselectedFontSize: 8,
                selectedFontSize: 15,
                onTap: (index){
                  bottom_nav_index=index;
                  setState(() {

                  });
                },
                currentIndex: bottom_nav_index,
                type: BottomNavigationBarType.shifting,
                items:list_bottomnavbar,
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.apps,size: 38,),
              backgroundColor: Colors.lightGreen,
              onPressed: (){
                //** sshow dialog chứa list các câu hỏi

                showDialog(context: context,builder: (BuildContext context){

                  return AlertDialog(
                    backgroundColor: Colors.transparent,
                    title: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0))
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: Text("DANH SÁCH CÂU HỎI",style: TextStyle(color: Colors.lightGreenAccent)),
                          ),
                          Row(children: <Widget>[
                            Container(width: 10,height: 10,color: Colors.lightGreenAccent,margin: EdgeInsets.fromLTRB(0, 0, 5, 0),),
                            Text("Đã chọn",style: TextStyle(fontSize: 12,color: Colors.lightGreenAccent),)
                          ],),
                          Row(children: <Widget>[
                            Container(width: 10,height: 10,color: Colors.white,margin: EdgeInsets.fromLTRB(0, 0, 5, 0),),
                            Text("Chưa chọn đáp án",style: TextStyle(fontSize: 12,color: Colors.white),)
                          ],)
                        ],),
                      ),
                    ),
                    content: GridView.count(
                      crossAxisCount: 4,
                      children:
                      List<Widget>.generate(30, (index){
                        return Container(
                          color: Colors.transparent,
                          margin: EdgeInsets.all(5.0),
                          child: RaisedButton(
                            color: Colors.transparent,
                            shape: new RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.green,
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),bottomLeft: Radius.circular(20.0)),
                            ),
                            child: Text(index.toString(),style: TextStyle(color: Colors.white),),
                            onPressed: (){
                              number_quest_now=index;
                              Toast.show(index.toString(), context);
                            },
                          ),
                        );
                      }),

                    ),
                    actions: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                        width: 120,
                        padding: EdgeInsets.all(0.0),
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          boxShadow: <BoxShadow>[BoxShadow(color: Colors.black45,offset: Offset(2.0,2.0),blurRadius: 1),],
                          gradient: LinearGradient(
                              colors: <Color>[Color(0xff2e7d14),Color(0xff3cb514),Color(0xff40f702)]),
                        ),
                        child:  FlatButton(
                            color: Colors.transparent,
                            child: Text("Quay lại"),
                            onPressed: () {
                              Navigator.pop(context);
                            }
                        ),
                      ),
                    ],
                  );
                });
              },
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          ),
        );

  }



  bool _handleScrollNotification(ScrollNotification notification){
    if (notification.depth == 0) {
      if (notification is UserScrollNotification) {
        final UserScrollNotification userScroll = notification;
        switch (userScroll.direction) {
          case ScrollDirection.forward:
            type_prac_or_exam==TYPE_PRAC_OR_EXAM.practice?_hide.forward():_hide.reverse();
            break;
          case ScrollDirection.reverse:
            _hide.reverse();
            break;
          case ScrollDirection.idle:
            break;
        }
      }
    }
    return false;
  }
}

