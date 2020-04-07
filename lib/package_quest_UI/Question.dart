import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Result { A, B, C, D, nullrs }
class MyQuestionUI extends StatefulWidget {
  final VoidCallback onChange;
  List<int> list_choose;
  MyQuestionUI({this.onChange}) {
    onChange() {
      onChange();
    }
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Question_Style_A(onChangeRadio: () {
      onChange();
    });
  }
}
class Question_Style_A extends State {
  String _quest, _result_A, _result_B, _result_C, _result_D;
  Result _result_choose;
  VoidCallback onChangeRadio;
  int _numberquest;
  static const double _borderRadius = 15.0,
      _paddingQuest = 10.0,
      _marginall = 8.0,
  _paddingResult=2.0;
  Question_Style_A({this.onChangeRadio}) {

  }
void setQuestion(){

}

  @override
  void initState() {
    _quest = "Nội dung câu hỏi? Câu-1: Nội dung câu hỏi? Câu-1: Nội dung câu hỏi? Câu-1: Nội dung câu hỏi? Câu-1: Nội dung câu hỏi? Câu-1: Nội dung câu hỏi?Câu-1: Nội dung câu hỏi?Câu-1: Nội dung câu hỏi?Câu-1: Nội dung câu hỏi?Câu-1: Nội dung câu hỏi?Câu-1: Nội dung câu hỏi?Câu-1: Nội dung câu hỏi?";
    _result_A = "Đáp án A";
    _result_B = "Đáp án B";
    _result_C = "Đáp án C";
    _result_D = "Đáp án D";
    _numberquest=-1;
    _result_choose=Result.nullrs;
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
            child: Text("Câu $_numberquest: $_quest"),
          ),//Quest
          aChoose(Result.A, _result_A),
          aChoose(Result.B, _result_B),
          aChoose(Result.C, _result_C),
          aChoose(Result.D, _result_D),
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
          _result_choose!=value?_result_choose = value: _result_choose=Result.nullrs;
          onChangeRadio();
          print(_result_choose);
        },
        contentPadding: EdgeInsets.fromLTRB(0, 3, 0, 3),
        leading: Radio(
          value: value,
          groupValue: _result_choose,
          activeColor: Colors.lightGreenAccent,
          onChanged: (index){
            _result_choose!=value?_result_choose = value: _result_choose=Result.nullrs;
            onChangeRadio();
          },
        ),
        title: Text(_content_result,style: TextStyle(fontSize: 15),),
      ),

    );
  }

  void onClickButtonNext(){

  }

  void onClickButtonPrevious(){

  }
  void onClickButtonSuccess(){

  }
}



