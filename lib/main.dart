

import 'package:challenge2camp/Deatails.dart';
import 'package:challenge2camp/constant.dart';
import 'package:challenge2camp/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          // or from RGB
          primary: primary,
          secondary: Colors.white,
        ),

      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
int currentIndex=0;

 List secreen=[
   MainScreen(),
   Text('hi'),
   Text('hi'),
   Text('hi'),
 ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: primary,
      body: secreen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: currentIndex,
        onTap: (index){setState(() {
          currentIndex=index;
        });},
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor:primary ,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,

        type: BottomNavigationBarType.fixed,
        items: const [

          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: 'shop'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), label: 'profile'),
        ],
      ),
    );
  }
}

