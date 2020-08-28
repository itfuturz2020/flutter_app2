import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:scroll_bottom_navigation_bar/scroll_bottom_navigation_bar.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appbarcontroller = ScrollController();
  final controller = ScrollController();

  final items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text("Home"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      title: Text("Settings"),
    ),
  ];

  bool notification;

  @override
  void initState() {
    super.initState();
    notification = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
        child: ScrollAppBar(
          controller: controller,
          automaticallyImplyLeading: false, // hides leading widget
          flexibleSpace: Container(),
        )
    ),
/*
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: ScrollAppBar(
            controller: controller, // Note the controller here
            title: Text("App Bar"),
            actions: [
              IconButton(
                icon: Icon(
                  notification ? Icons.notifications : Icons.notifications_off,
                ),
                onPressed: () {
                  setState(() => notification = !notification);
                },
              ),
            ],
          ),
        ),
*/
        body: Snap(
          controller: controller.appBar,
          child: ListView.builder(
            controller: controller, // Controller is also here
            itemBuilder: _listBuildItem,
          ),
        ),
        bottomNavigationBar: ScrollBottomNavigationBar(
          controller: controller,
          items: items,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget _listBuildItem(BuildContext context, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      color: Color(Random().nextInt(0xffffffff)),
      child: Center(child: Text("$index")),
    );
  }
}