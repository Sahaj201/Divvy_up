import 'dart:async';

import 'package:divvyup/screens/main_screen.dart';
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
                primarySwatch: Colors.purple,
              ),
              initialRoute: homepageID,
              onGenerateRoute: (settings) {
                var pageName = settings.name;
                var args = settings.arguments;
                if (pageName == loginsignupID) {
                  return MaterialPageRoute(
                      builder: (context) => LoginSignupScreen());
                }
                if (pageName == homepageID) {
                  return MaterialPageRoute(builder: (context) => MyHomePage());
                }
                if (pageName == signupID)
                  return MaterialPageRoute(builder: (context) => Signup());
                if (pageName == mainScreenID)
                  return MaterialPageRoute(builder: (context) => MainScreen());
              },
            ));
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
