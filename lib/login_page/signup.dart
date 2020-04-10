import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testappflutter/login_page/Widget/bezierContainer.dart';
import 'package:testappflutter/login_page/loginPage.dart';
import 'package:toast/toast.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

enum INPUT_TEXTFEIL{username,password,email}
class _SignUpPageState extends State<SignUpPage> {
  String username="",email="",password="";

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title,INPUT_TEXTFEIL input_textfeil, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true),
                  onChanged: (value){
                    switch(input_textfeil){

                      case INPUT_TEXTFEIL.username:
                        // TODO: Handle this case.
                      username=value;
                        break;
                      case INPUT_TEXTFEIL.password:
                        // TODO: Handle this case.
                      password=value;
                        break;
                      case INPUT_TEXTFEIL.email:
                        // TODO: Handle this case.
                      email=value;
                        break;
                    }
                  },

          )
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xff145208), Color(0xff70fa55)])),
      child: Text(
        'Đăng ký',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Đã có tài khoản ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'Đăng nhập',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: '',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xff00bd0d),
          ),
          children: [
            TextSpan(
              text: 'M',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'J',
              style: TextStyle(color: Color(0xff00bd0d), fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Tài khoản",INPUT_TEXTFEIL.username),
        _entryField("Email",INPUT_TEXTFEIL.email),
        _entryField("Mật khẩu",INPUT_TEXTFEIL.password, isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Container(
          height: MediaQuery.of(context).size.height,
          child:Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: SizedBox(),
                    ),
                    _title(),
                    SizedBox(
                      height: 50,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(0.0),
                      child:  _submitButton(),
                      onPressed: (){
                        Toast.show(username+"-"+password+"-"+email, context);
                      },
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: _loginAccountLabel(),
              ),
              Positioned(top: 40, left: 0, child: _backButton()),
//              Positioned(
//                  top: -MediaQuery.of(context).size.height * .15,
//                  right: -MediaQuery.of(context).size.width * .4,
//                  child: BezierContainer())
            ],
          ),
        )
      )
    );
  }
}
