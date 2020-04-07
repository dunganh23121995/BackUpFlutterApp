import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testappflutter/Pages/PageShowQuest.dart';
import 'package:testappflutter/Practice/group_field.dart';
import 'package:testappflutter/Practice/pratice_list_nav.dart';
import 'package:testappflutter/app_theme.dart';
import 'package:toast/toast.dart';

class PracticePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SubPracticePage();
  }
}
class SubPracticePage extends State<PracticePage>{
  final _margin_top = 10.0,_margin_right=2.0,_margin_left=2.0,_margin_bottom=10.0;
  GROUPBUTTON _groupbutton_choose;
  TYPE_PRAC_OR_EXAM _type_prac_or_exam;
  TYPEPRACTICE _typepractice;
  final _border_radius = 20.0;
  bool _warring_chosse_PRAC_EXAM=false;
  List<InforNavOfPratice> list_khaosat = InforNavOfPratice.list_infor_I;
  List<InforNavOfPratice> list_thietke = InforNavOfPratice.list_infor_II;
  List<InforNavOfPratice> list_giamsat = InforNavOfPratice.list_infor_III;
  List<InforNavOfPratice> list_dinhgia = InforNavOfPratice.list_infor_IV;
  List<InforNavOfPratice> list_dautu = InforNavOfPratice.list_infor_V;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
        body: Container(
          color: Colors.grey.withOpacity(0.25),
          child: Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 130,),
                        Container(
                          margin: EdgeInsets.only(left: _margin_left,right: _margin_right,top: _margin_top,bottom:_margin_bottom),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(_border_radius)),
                            boxShadow: [BoxShadow(color: Colors.grey,offset: Offset(2.0,2.0))],
                            color: AppTheme.white,
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                                child: Stack(
                                  children: <Widget>[
                                    _warring_chosse_PRAC_EXAM==true?
                                    Align(child: Icon(Icons.warning,color: Colors.red,size: 16,),alignment: Alignment.centerLeft,):
                                    SizedBox(),
                                    Align(child: Text("CHỌN DANH MỤC",style: TextStyle(fontSize: 18,)),alignment: Alignment.center,),
                                  ],
                                ),
                              ),
                              //some things
                              RadioListTile(
                                title: Text("Ôn Luyện Theo Danh Mục",style: TextStyle(color: _type_prac_or_exam==TYPE_PRAC_OR_EXAM.practice?Colors.green:Colors.black, fontSize: 16 ),),
                                value: TYPE_PRAC_OR_EXAM.practice,
                                groupValue: _type_prac_or_exam,
                                activeColor: Colors.greenAccent,
                                secondary: IconButton(
                                  icon: Icon(Icons.live_help,color: _type_prac_or_exam==TYPE_PRAC_OR_EXAM.practice?Colors.green:Colors.grey,),
                                  onPressed: (){
                                    Toast.show("click",context);
                                  },
                                ),
                                onChanged: (index){
                                  _type_prac_or_exam=index;
                                  _warring_chosse_PRAC_EXAM=false;
                                  setState(() {
                                  });
                                },
                              ),
                              RadioListTile(
                                title: Text("Thi Thử Giống Thi Thật",style: TextStyle(color: _type_prac_or_exam==TYPE_PRAC_OR_EXAM.exam?Colors.green:Colors.black, fontSize: 16 )),
                                value: TYPE_PRAC_OR_EXAM.exam,
                                groupValue: _type_prac_or_exam,
                                activeColor: Colors.greenAccent,
                                secondary: IconButton(
                                  icon: Icon(Icons.live_help,color: _type_prac_or_exam==TYPE_PRAC_OR_EXAM.exam?Colors.green:Colors.grey,),
                                  onPressed: (){
                                    Toast.show("click",context);
                                  },
                                ),
                                onChanged: (index){
                                  _warring_chosse_PRAC_EXAM=false;
                                  _type_prac_or_exam=index;
                                  setState(() {

                                  });
                                },
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: _margin_left,right: _margin_right,top: _margin_top,bottom:_margin_bottom),
                          padding: EdgeInsets.fromLTRB(8,8,8,8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(_border_radius)),
                            boxShadow: [BoxShadow(color: Colors.grey,offset: Offset(2.0,2.0))],
                            color: AppTheme.blue_background3,
                          ),
                          child: Column(
                            children: <Widget>[
                              makeGroupPractice(list_khaosat, GROUPBUTTON.khaosatxaydung,"LĨNH VỰC KHẢO SÁT XÂY DỰNG"),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: _margin_left,right: _margin_right,top: _margin_top,bottom:_margin_bottom),
                          padding: EdgeInsets.fromLTRB(8,8,8,8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(_border_radius)),
                            boxShadow: [BoxShadow(color: Colors.grey,offset: Offset(2.0,2.0))],
                            color: AppTheme.red_background3,
                          ),
                          child: Column(
                            children: <Widget>[
                              makeGroupPractice(list_thietke, GROUPBUTTON.thietke,"LĨNH VỰC THIẾT KẾ"),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: _margin_left,right: _margin_right,top: _margin_top,bottom:_margin_bottom),
                          padding: EdgeInsets.fromLTRB(8,8,8,8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(_border_radius)),
                            boxShadow: [BoxShadow(color: Colors.grey,offset: Offset(2.0,2.0))],
                            color: AppTheme.yellow_background3,
                          ),
                          child: Column(
                            children: <Widget>[
                              makeGroupPractice(list_giamsat, GROUPBUTTON.giamsat,"LĨNH VỰC GIÁM SÁT"),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: _margin_left,right: _margin_right,top: _margin_top,bottom:_margin_bottom),
                          padding: EdgeInsets.fromLTRB(8,8,8,8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(_border_radius)),
                            boxShadow: [BoxShadow(color: Colors.grey,offset: Offset(2.0,2.0))],
                            color: AppTheme.puper_background3,
                          ),
                          child: Column(
                            children: <Widget>[
                              makeGroupPractice(list_dinhgia, GROUPBUTTON.dinhgia,"LĨNH VỰC ĐỊNH GIÁ XÂY DỰNG"),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: _margin_left,right: _margin_right,top: _margin_top,bottom:_margin_bottom),
                          padding: EdgeInsets.fromLTRB(8,8,8,8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(_border_radius)),
                            boxShadow: [BoxShadow(color: Colors.grey,offset: Offset(2.0,2.0))],
                            color: AppTheme.green_background3,
                          ),
                          child: Column(
                            children: <Widget>[
                              makeGroupPractice(list_dautu, GROUPBUTTON.quanlydautu,"LĨNH VỰC QUẢN LÝ ĐẦU TƯ XÂY DỰNG"),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                      ],
                    ),
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
                        child: Text("ÔN   LUYỆN   THI   CỬ",style: GoogleFonts.robotoCondensed(color: Colors.lightGreen,fontSize: 25,
                            fontWeight: FontWeight.w700,
                            shadows: <Shadow>[Shadow(color: Colors.blue.withOpacity(0.25),offset: Offset(2.0,2.0),blurRadius: 1.0)]
                        ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child:
                          IconButton(padding: EdgeInsets.all(0.0),icon: Icon(Icons.arrow_back,color: Colors.green.withAlpha(200),size: 28,),onPressed: (){
                            Navigator.pop(context);
                          },),
                      )
                    ],),
                  ),
                ],
          ),
        ),
      );

  }

Widget makeGroupPractice(List<InforNavOfPratice> listbutton,GROUPBUTTON groupbutton,String namegroup){

  return Column(
    children: <Widget>[
      new ButtonTheme(
        child: RaisedButton(
          elevation: _groupbutton_choose==groupbutton?8:2,
          color: AppTheme.white.withAlpha(240),
          colorBrightness: Brightness.light,
          splashColor: Colors.lightBlueAccent,
          onPressed: (){
            _groupbutton_choose==groupbutton?_groupbutton_choose=null:_groupbutton_choose=groupbutton;
            setState(() {

            });
          },
          child:Stack(children: <Widget>[
            Align(child: Text(namegroup),alignment: Alignment.centerLeft,),
            Align(child: Icon(Icons.arrow_drop_down_circle,color: _groupbutton_choose==groupbutton?Colors.lightBlueAccent:Colors.grey,),alignment: Alignment.centerRight,),
          ],),
        ),
        minWidth: 258,
      ),
      !equalButton(_groupbutton_choose, groupbutton)?SizedBox():
      Container(
        child: Column(
            children: <Widget>[
              for(int i=0;i<listbutton.length;i++)
                Container(
                  padding: EdgeInsets.fromLTRB(18, 0, 0, 0),
                  child: RaisedButton(
                    splashColor: Colors.lightBlueAccent,
                    color: AppTheme.white.withAlpha(240),
                    colorBrightness: Brightness.light,
                    onPressed: (){
                      _typepractice = listbutton[i].typepractice;
                      if(_type_prac_or_exam!=null && _typepractice != null)
                      onclickRoutertoQuestPage();
                      else   {
                        Toast.show("Chưa chọn danh mục", context);
                        _warring_chosse_PRAC_EXAM=true;
                        setState(() {

                        });
                      }
                    },
                    child:Stack(children: <Widget>[
                      Container(padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child:Align(child: Text(listbutton[i].namebutton,),alignment: Alignment.centerLeft,),
                      ),
                      Align(child: Icon(Icons.arrow_forward_ios,color: _groupbutton_choose==groupbutton?Colors.lightBlueAccent:Colors.grey,),alignment: Alignment.centerRight,),
                    ],),
                  ),
                ),

            ],),
      ),
    ],
  );
}

bool equalButton(GROUPBUTTON a, GROUPBUTTON b){
    return a==b?true:false;
}


void onclickRoutertoQuestPage(){
  showDialog(context: context,
    builder: (BuildContext context){
      return AlertDialog(
        backgroundColor: Colors.transparent,
          title: Text(getTitleDialog(),style: GoogleFonts.robotoCondensed(color: Colors.lightGreen,fontSize: 25,
              fontWeight: FontWeight.w700,
              shadows: <Shadow>[Shadow(color: Colors.blue.withOpacity(0.25),offset: Offset(2.0,2.0),blurRadius: 1.0)]
          ),),
          actions:<Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              padding: EdgeInsets.all(0.0),
              decoration:BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
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
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              padding: EdgeInsets.all(0.0),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
                        boxShadow: <BoxShadow>[BoxShadow(color: Colors.black45,offset: Offset(2.0,2.0),blurRadius: 1),],
                          gradient: LinearGradient(
                          colors: <Color>[Color(0xff2e7d14),Color(0xff3cb514),Color(0xff40f702)]),
                            ),
                            child:  FlatButton(
                                child: Text("Sát hạch cấp mới"),
                                color: Colors.transparent,
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) =>
                                          ShowQuest(type_prac_or_exam: _type_prac_or_exam,
                                            typepractice: _typepractice,
                                            type_examination: TYPE_EXAMINATION.newnew,)));
                                }
                            ),
              ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              padding: EdgeInsets.all(0.0),
              decoration:BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                boxShadow: <BoxShadow>[BoxShadow(color: Colors.black45,offset: Offset(2.0,2.0),blurRadius: 1),],
                gradient: LinearGradient(
                    colors: <Color>[Color(0xff2e7d14),Color(0xff3cb514),Color(0xff40f702)]),
              ),
              child:  FlatButton(
                color: Colors.transparent,
                  child: Text("Sát hạch Miễn chuyên môn"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            ShowQuest(type_prac_or_exam: _type_prac_or_exam,
                              typepractice: _typepractice,
                              type_examination: TYPE_EXAMINATION.notspecialize,)));
                  }
              ),
            ),
          ],
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width-100,
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.fromLTRB(0,0,0,10),
                  decoration: BoxDecoration(
                    color: AppTheme.green_background3,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        _type_prac_or_exam==TYPE_PRAC_OR_EXAM.practice?
                            listStringDialog_PRAC[0]:listStringDialog_EXAM[0]
                      ),//Title
                      Text(_type_prac_or_exam==TYPE_PRAC_OR_EXAM.practice?
                      listStringDialog_PRAC[1]:listStringDialog_EXAM[1]),//Content
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width-100,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: AppTheme.green_background3,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                          _type_prac_or_exam==TYPE_PRAC_OR_EXAM.practice?
                          listStringDialog_PRAC[2]:listStringDialog_EXAM[2]
                      ),//Title
                      Text(_type_prac_or_exam==TYPE_PRAC_OR_EXAM.practice?
                      listStringDialog_PRAC[3]:listStringDialog_EXAM[3]),//Content
                    ],
                  ),
                ),
              ],
            ),
          ),

      );
    },
  );
}

String getTitleDialog(){
  switch(_typepractice){
    case TYPEPRACTICE.ks_diahinh:
      // TODO: Handle this case.
    return list_khaosat[0].namebutton;
      break;
    case TYPEPRACTICE.ks_congtrinh:
      // TODO: Handle this case.
      return list_khaosat[1].namebutton;
      break;
    case TYPEPRACTICE.tk_quyhoachxaydung:
      // TODO: Handle this case.
    return list_thietke[0].namebutton;
      break;
    case TYPEPRACTICE.tk_kientruccongtrinh:
      // TODO: Handle this case.
      return list_thietke[1].namebutton;
      break;
    case TYPEPRACTICE.tk_ketcaucongtrinh:
      // TODO: Handle this case.
      return list_thietke[2].namebutton;
      break;
    case TYPEPRACTICE.tk_codiencongtrinh:
      // TODO: Handle this case.
      return list_thietke[3].namebutton;
      break;
    case TYPEPRACTICE.tk_capthoatnuoccongtrinh:
      // TODO: Handle this case.
      return list_thietke[4].namebutton;
      break;
    case TYPEPRACTICE.tk_xdctgiaothong:
      // TODO: Handle this case.
      return list_thietke[5].namebutton;
      break;
    case TYPEPRACTICE.tk_xdctnongnghiepnongthon:
      // TODO: Handle this case.
      return list_thietke[6].namebutton;
      break;
    case TYPEPRACTICE.tk_xdcthathangkythuat:
      // TODO: Handle this case.
      return list_thietke[7].namebutton;
      break;
    case TYPEPRACTICE.gs_dandungcongnghiep:
      // TODO: Handle this case.
    return list_giamsat[0].namebutton;
      break;
    case TYPEPRACTICE.gs_giaothong:
      // TODO: Handle this case.
      return list_giamsat[1].namebutton;
      break;
    case TYPEPRACTICE.gs_nongnghiepPTNT:
      // TODO: Handle this case.
      return list_giamsat[2].namebutton;
      break;
    case TYPEPRACTICE.gs_lapdatthietbi:
      // TODO: Handle this case.
      return list_giamsat[3].namebutton;
      break;
    case TYPEPRACTICE.dgxd_dinhgiaxaydung:
      // TODO: Handle this case.
    return list_dinhgia[0].namebutton;
      break;

    case TYPEPRACTICE.qldt_quanlyduandautuxd:
      // TODO: Handle this case.
      return list_dautu[0].namebutton;
      break;
  }
}
}