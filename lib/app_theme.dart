import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFDFDFD);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xff213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'WorkSans';

  static const Color pink_background = Color(0xffffd9d6);
  static const Color orange_backgroud = Color(0xfffff2d6);
  static const Color yellow_background = Color(0xfffaffd6);
  static const Color green_background1 = Color(0xffecffd6);
  static const Color green_background2 = Color(0xffd8ffd6);
  static const Color blue_backdround1 = Color(0xffd6ffee);
  static const Color blue_backdround2 = Color(0xffd6f5ff);
  static const Color puper_background1 = Color(0xffe7d6ff);
  static const Color puper_background2 = Color(0xffffd6fa);
  static const Color pink_background_1 = Color(0xfffccae8);
  static const Color grey_background = Color(0xffebebeb);
  static const Color appbar_onthi = Color(0xffdcedc8);
  static const Color blue_background3 = Color(0xfff0f2ff);
  static const Color green_background3 = Color(0xfff0fff5);
  static const Color red_background3 = Color(0xfffff0f1);
  static const Color puper_background3 = Color(0xfff5f0ff);
  static const Color yellow_background3 = Color(0xfffdfff0);




  static const TextTheme textTheme = TextTheme(
    display1: display1,
    headline: headline,
    title: title,
    subtitle: subtitle,
    body2: body2,
    body1: body1,
    caption: caption,
  );

  static const TextStyle display1 = TextStyle( // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle headline = TextStyle( // h5 -> headline
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const TextStyle title = TextStyle( // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle subtitle = TextStyle( // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle body2 = TextStyle( // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle body1 = TextStyle( // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle caption = TextStyle( // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );

}
