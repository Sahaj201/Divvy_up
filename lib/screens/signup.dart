import 'package:divvyup/screens/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'homepage.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool buttonvisibility = true;
  bool progressbarvisibility = false;
  String email = "";
  String pass = "";
  String confirmpass = "";
  String name = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  void createaccount() async {
    if (name != null) {
      if (pass == confirmpass) {
        print("enter");
        try {
          final user = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: pass);
          if (user != null) {
            Navigator.pushReplacement(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext context) => new HomePage()));
            Fluttertoast.showToast(
              msg: "Signed Up Successfully",
            );
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            buttonvisibility = true;
            progressbarvisibility = false;
            Fluttertoast.showToast(
              msg: "The password provided is too weak.",
            );
          } else if (e.code == 'email-already-in-use') {
            buttonvisibility = true;
            progressbarvisibility = false;
            Fluttertoast.showToast(
              msg: "The account already exists for that email.",
            );
          }
        } catch (e) {
          buttonvisibility = true;
          progressbarvisibility = false;
          print(e);
        }
      } else {
        buttonvisibility = true;
        progressbarvisibility = false;
        Fluttertoast.showToast(
          msg: "Password Not Match",
        );
      }
    } else {
      buttonvisibility = true;
      progressbarvisibility = false;
      Fluttertoast.showToast(
        msg: "Name Cannot be empty",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff674FC4),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 52.h,
                      ),
                      Text("Sign Up to Divvy Up",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffffff24))),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        children: [
                          Text("Already have an account?",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey)),
                          Text(
                            " Login",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffffff24)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      TextField(
                          onChanged: (value) {
                            name = value;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 14.h),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Full Name",
                              hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black))),
                      SizedBox(
                        height: 16.h,
                      ),
                      TextField(
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 14.h),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Email address",
                              hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black))),
                      SizedBox(
                        height: 16.h,
                      ),
                      TextField(
                          obscureText: true,
                          onChanged: (value) {
                            pass = value;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 14.h),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black))),
                      SizedBox(
                        height: 16.h,
                      ),
                      TextField(
                          obscureText: true,
                          onChanged: (value) {
                            confirmpass = value;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 14.h),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Confirm Password",
                              hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black))),
                      SizedBox(
                        height: 16.h,
                      ),
                      Stack(children: [
                        Visibility(
                          visible: buttonvisibility,
                          child: SizedBox(
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () {
                                buttonvisibility = false;
                                progressbarvisibility = true;
                                createaccount();
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.purple),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(vertical: 14.h))),
                              child: Text("Create Account",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),
                        ),
                        Visibility(
                            visible: progressbarvisibility,
                            child: Center(child: CircularProgressIndicator()))
                      ]),
                    ]))));
  }
}
