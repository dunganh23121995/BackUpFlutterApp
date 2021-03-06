import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testappflutter/app_theme.dart';
import 'package:testappflutter/database/my_sqlite.dart';
import 'package:testappflutter/navigation_home_screen.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() async {
//  WidgetsFlutterBinding.ensureInitialized();
  await runApp(MyApp());

  Database db = await new MyDatabaseHelp().initializeDatabase();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
      ),
      home: NavigationHomeScreen(),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

Future<String> loadDataToPath(String path) async {
  return await rootBundle.loadString(path);
}
