import 'package:flutter/widgets.dart';
import 'package:testappflutter/Pages/clock.dart';
import 'package:testappflutter/Practice/practice_page.dart';
import 'package:testappflutter/home_screen.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
    this.titleHomelist='',
    this.backgroundColor,
  });

  Widget navigateScreen;
  String imagePath;
  String titleHomelist;
  Color backgroundColor;
  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/images/book.png',
      navigateScreen: new PracticePage(),
      titleHomelist: "ÔN LUYỆN THI CỬ",
      backgroundColor: Color(0xffdcedc8),
    ),
    HomeList(
      imagePath: 'assets/images/key.png',
      navigateScreen: new ClockCountDown(),
      titleHomelist: "KÍCH HOẠT KEY",
      backgroundColor: Color(0xfffff9c4),
    ),
    HomeList(
      imagePath: 'assets/images/result.png',
      navigateScreen: MyHomePage(),
        titleHomelist: "KẾT QUẢ",
      backgroundColor: Color(0xffe1f5fe),
    ),
  ];
}
