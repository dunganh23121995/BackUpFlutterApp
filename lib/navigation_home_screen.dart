
import 'package:flutter/material.dart';
import 'package:testappflutter/app_theme.dart';
import 'package:testappflutter/custom_drawer/drawer_user_controller.dart';
import 'package:testappflutter/custom_drawer/home_drawer.dart';
import 'package:testappflutter/home_screen.dart';
class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;
  AnimationController sliderAnimationController;
  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = const MyHomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return   Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            animationController: (AnimationController animationController) {
              sliderAnimationController = animationController;
            },
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
            },
            screenView: screenView,
          ),
        ),
      ),
    );

  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = const MyHomePage();
        });
      } else if (drawerIndex == DrawerIndex.Help) {
        setState(() {
          screenView = MyHomePage();
        });
      } else if (drawerIndex == DrawerIndex.FeedBack) {
        setState(() {
          screenView = MyHomePage();
        });
      } else if (drawerIndex == DrawerIndex.Invite) {
        setState(() {
          screenView = MyHomePage();
        });
      } else {
        //do in your way......
      }
    }
  }
}
