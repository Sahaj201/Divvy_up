import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      getTextField("Full Name"),
                      SizedBox(
                        height: 16.h,
                      ),
                      getTextField("Email address"),
                      SizedBox(
                        height: 16.h,
                      ),
                      getTextField("Password"),
                      SizedBox(
                        height: 16.h,
                      ),
                      getTextField("Confirm Password"),
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {},
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
                      )
                    ]))));
  }
}

class getTextField extends StatelessWidget {
  final String hint;

  const getTextField(
    this.hint, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.white, width: 0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.white, width: 0),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            filled: true,
            fillColor: Colors.white,
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black)));
  }
}
