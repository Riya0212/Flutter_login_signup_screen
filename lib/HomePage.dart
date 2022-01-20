import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screens/HomePageScreens/Home.dart';
import 'Screens/HomePageScreens/Liked.dart';
import 'Screens/HomePageScreens/Profile.dart';
import 'Screens/HomePageScreens/Search.dart';
import 'Screens/HomePageScreens/Settings.dart';

class HomePage extends StatefulWidget {
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // bool isLoggedin = false;
  //checkAuthentication() async {}
  PageController pageController = new PageController();
  int currentIndex = 0;

  void onTap(int page) {
    setState(() {
      currentIndex = page;
    });
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        controller: pageController,
        children: [
          Home(),
          Search(),
          Liked(),
          Settings(),
          Profile(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        elevation: 0,
        backgroundColor: Colors.black87,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(
          color: Colors.redAccent,
        ),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        unselectedLabelStyle: TextStyle(color: Colors.white),
        unselectedItemColor: Colors.white,
        iconSize: 26.0,
        selectedFontSize: 14.0,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        unselectedFontSize: 12.0,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text("Search")),
          BottomNavigationBarItem(
              icon: Icon(Icons.thumb_up), title: Text("Liked")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("Settings")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("Profile")),
        ],
      ),
    );
  }
}
