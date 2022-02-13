import 'package:divvyup/screens/routing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.purple),
          Column(children: [
            SizedBox(
              height: 58.h,
            ),
            /*Image.asset('assets/images/img1.png'),
            Container(child: Text("Are you ok"), color: Colors.white)*/
          ]),
          Container(
            color: Colors.black,
            margin: EdgeInsets.fromLTRB(0, 138.h, 0, 0),
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Column(
              children: [
                SizedBox(
                  height: 94.h,
                ),
                textdesign(Colors.yellow, "Track Personal Expenses",
                    Icons.addchart_rounded),
                SizedBox(
                  height: 25.h,
                ),
                textdesign(Colors.red, "Split Bills", Icons.account_tree_sharp),
                SizedBox(
                  height: 25.h,
                ),
                textdesign(Colors.brown, "Make Payments",
                    Icons.account_balance_wallet),
                SizedBox(
                  height: 102.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, homeScreenID);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.purple),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 14.h))),
                    child: Text("Login",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w700)),
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Text("Or",
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
                SizedBox(
                  height: 13.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, signupID);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.purple),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 14.h))),
                    child: Text("Signup",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class textdesign extends StatelessWidget {
  final Color customColor;
  final String text;
  final IconData icon;

  const textdesign(
    this.customColor,
    this.text,
    this.icon, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        icon,
        color: customColor,
        size: 28.sp,
      ),
      SizedBox(
        width: 16.h,
      ),
      Text(
        text,
        style: TextStyle(
            fontSize: 22.sp, fontWeight: FontWeight.w700, color: Colors.white),
      )
    ]);
  }
}
