import 'package:slashkey/core/fonts.dart';
import 'package:slashkey/presentation/home/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slashkey/presentation/home/widgets/bottom_nav.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.black,
        backgroundColor: Colors.white70,
        fontFamily: primaryFont,
        textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.black),
            bodyText2: TextStyle(color: Colors.grey)
        )
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _pages = [
    ScreenHome(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGO'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, _) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}

