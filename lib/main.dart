import 'dart:async';

import 'package:divvyup/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:divvyup/screens/routing.dart';
import 'package:divvyup/screens/login_signup_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 640),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () => MaterialApp(
                title: 'Divvy Up',
                theme: ThemeData(
                  // This is the theme of your application.
                  //
                  // Try running your application with "flutter run". You'll see the
                  // application has a blue toolbar. Then, without quitting the app, try
                  // changing the primarySwatch below to Colors.green and then invoke
                  // "hot reload" (press "r" in the console where you ran "flutter run",
                  // or simply save your changes to "hot reload" in a Flutter IDE).
                  // Notice that the counter didn't reset back to zero; the application
                  // is not restarted.
                  primarySwatch: Colors.blue,
                ),
                home: MyHomePage(),
                routes: {
                  loginsignupID: (context) {
                    return const LoginSignupScreen();
                  },
                  signupID: (context) {
                    return const Signup();
                  },
                }));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushNamed(context, loginsignupID));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xff674FC4),
        child: Image.asset(
          'assets/images/SplashScreenlogo.png',
        ));
  }
}
