import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testappflutter/Practice/group_field.dart';
import 'package:testappflutter/app_theme.dart';
import 'package:testappflutter/Pages/quest_list.dart';
import 'package:testappflutter/database/questDB.dart';
import 'package:toast/toast.dart';

class ShowQuest extends StatefulWidget{
  ShowQuest({@required this.type_prac_or_exam,@required this.typepractice,@required this.type_examination}){
  }
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
  Timer _timer;
  int hourtime=88,minutestime=88,secondstime=88,bottom_nav_index,_number_quest_now;
  DateTime endDateTime;
  Duration tmpDuration;
  TYPE_PRAC_OR_EXAM type_prac_or_exam;
  TYPEPRACTICE typepractice;
  TYPE_EXAMINATION type_examination;
  static bool endTimeExam=false;
  AnimationController _hide;
  static const double _borderRadius = 15.0, _paddingQuest = 10.0, _marginall = 8.0, _paddingResult=2.0;
  static List<Quest> list_quest_exam,list_quest_all,list_quest_subject,list_quest_achievement;
  static List<Quest> list_control;
  static Quest _quest_current;

  SubShowQuest({this.typepractice,this.type_prac_or_exam, this.type_examination}){
    _number_quest_now=0;

    //list get data for us
    list_quest_exam= new List();
    list_quest_all= new List();
    list_quest_subject= new List();
    list_quest_achievement= new List();
    _quest_current=new Quest();

  }
  Widget display_quest(){
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 110,),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(_marginall),
              padding: EdgeInsets.all(_paddingQuest),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38.withOpacity(0.75),
                      spreadRadius: 0.25,
                      offset: Offset(2.0, 3.0))
                ],
                borderRadius:
                BorderRadius.all(const Radius.circular(_borderRadius)),
                color: Colors.white.withOpacity(1.0),
              ),
              child: Text("Câu ${_number_quest_now}: ${_quest_current.contentQuest}"),
            ),//Quest
            aChoose(Result.A, _quest_current.result_contentA),
            aChoose(Result.B, _quest_current.result_contentB),
            aChoose(Result.C, _quest_current.result_contentC),
            aChoose(Result.D, _quest_current.result_contentD),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  SizedBox(width: MediaQuery.of(context).size.width,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: RaisedButton(
                        padding: EdgeInsets.all(0.0),
                        splashColor: Colors.lightBlue,
                        shape: new RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.lightBlue,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),bottomLeft: Radius.circular(30.0)),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width/2.35,
                          child: Icon(Icons.skip_previous,color: Colors.lightBlue,size: 38,),
                        ),
                        onPressed: (){
                          onClickButtonPrevious();
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(2, 0, 0, 0),
                      child: RaisedButton(
                        padding: EdgeInsets.all(0.0),
                        splashColor: Colors.lightBlue,
                        shape: new RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.lightBlue,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.only(topRight: Radius.circular(30.0),bottomRight: Radius.circular(30.0)),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width/2.35,
                          child: Icon(Icons.skip_next,color: Colors.lightBlue,size: 38,),
                        ),
                        onPressed: (){
                          onClickButtonNext();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text("NỘP BÀI",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.green),),
            ),
            Container(
              child: RaisedButton(
                padding: EdgeInsets.all(0.0),
                splashColor: Colors.lightGreenAccent,
                shape: new RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.green,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width/2.35,
                  child: Icon(Icons.done_all,color: Colors.lightGreenAccent,size: 38,),
                ),
                onPressed: (){
                  onClickButtonSuccess();
                },
              ),
            ),
            SizedBox(height: 100,)
          ],
        ),),

    );
  }
  Widget aChoose(Result value, String _content_result) {
    return Container(
      margin: EdgeInsets.all(_marginall),
      padding: EdgeInsets.all(_paddingResult),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.orange.withAlpha(100),
              spreadRadius: 0.25,
              offset: Offset(1.0, 1.0))
        ],
        borderRadius: BorderRadius.all(const Radius.circular(_borderRadius)),
        color: Colors.white,
      ),
      child: ListTile(
        onTap: (){
          _quest_current.result_choose!=value?_quest_current.result_choose = value: _quest_current.result_choose=Result.nullrs;
          print(_quest_current.result_choose);
        },
        contentPadding: EdgeInsets.fromLTRB(0, 3, 0, 3),
        leading: Radio(
          value: value,
          groupValue: type_prac_or_exam==TYPE_PRAC_OR_EXAM.exam?_quest_current.result_choose:_quest_current.resultSuccess,
          activeColor: Colors.lightGreenAccent,
          onChanged: (index){
            _quest_current.result_choose!=value?_quest_current.result_choose = value: _quest_current.result_choose=Result.nullrs;
            setState(() {

            });
          },
        ),
        title: Text(_content_result,style: TextStyle(fontSize: 15),),
      ),

    );
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
    bottom_nav_index=0;
    //settime exam
    endDateTime = DateTime.now().add(Duration(seconds: 3600));
    _hide = AnimationController(vsync: this,duration: kThemeAnimationDuration);
      //Khởi tạo gán list_control
    if(type_prac_or_exam==TYPE_PRAC_OR_EXAM.exam){
      type_examination==TYPE_EXAMINATION.newnew?
      endDateTime = DateTime.now().add(Duration(seconds: 30*60+2)):
      endDateTime = DateTime.now().add(Duration(seconds: 12*60+2));

      list_control=list_quest_exam;
      startTimer();
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(type_prac_or_exam==TYPE_PRAC_OR_EXAM.exam){
      switch(bottom_nav_index){
        case 0:
          list_control=list_quest_achievement;
          break;
        case 1:
          list_control=list_quest_subject;
          break;
        default:
          list_control =list_quest_all;
        break;
      }
    }//Set litst_quest_control to listquest_prac
    list_control.length!=0?_quest_current=list_control[_number_quest_now]:{};

    return NotificationListener<ScrollNotification>(
          onNotification: _handleScrollNotification,
          child: Scaffold(
            body: Container(
              color: Colors.grey.withOpacity(0.25),
              child: Stack(
                children: <Widget>[
                  SizedBox(height: 130,),
                  display_quest(),

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
                  _number_quest_now=0;
                  setState(() {

                  });
                  Toast.show(index.toString(), context);
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
                              _number_quest_now=index;
                              Navigator.pop(context,index);
                              setState(() {

                              });
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
                setState(() {

                });
              },
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          ),
        );

  }

  void onClickButtonNext(){
    _number_quest_now>=list_control.length-1?_number_quest_now=0:_number_quest_now++;
    setState(() {

    });
  }
  void onClickButtonPrevious(){
    _number_quest_now<=0?_number_quest_now=list_control.length-1:_number_quest_now--;
    setState(() {

    });
  }
  void onClickButtonSuccess(){
    if(type_prac_or_exam==TYPE_PRAC_OR_EXAM.exam){
      //Thêm code cho việc nộp bài vào đây
    }
    else
      Toast.show("Chức năng dành cho thi thử",context);
  }
}

