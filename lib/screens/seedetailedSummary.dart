import 'package:divvyup/expense_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:divvyup/expense_data.dart';
import 'package:provider/provider.dart';
import '../expense.dart';

class Summary extends StatefulWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  List<Widget> summry = [];
  List<dynamic> exp = [];
  List<Widget> summaryview() {
    List<Widget> seesummary = [];
    print(exp);
    for (var i in exp) {
      print(i.expenseName);
      seesummary.add(Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text(i.expenseName), Text(i.expense.toString())],
        )
      ]));
    }
    return seesummary;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(builder: (context, expenseData, x) {
      return Scaffold(
          backgroundColor: Color(0xff202020),
          appBar: AppBar(
            title: Text("Detailed Summary"),
          ),
          body: () {
            {
              exp = expenseData.allExpense;
              summry = summaryview();
              return Padding(
                  padding: EdgeInsets.fromLTRB(35.w, 0, 35.w, 0),
                  child: Column(children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xff262626),
                          ),
                          width: 136.w,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(" You'll Get",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.sp)),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Rs 9555",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20.sp),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xff262626),
                          ),
                          width: 136.w,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(" You'll pay",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.sp)),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Rs 9555",
                                style: TextStyle(
                                    color: Colors.red, fontSize: 20.sp),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: Text("All Expenses",
                          style:
                              TextStyle(fontSize: 20.sp, color: Colors.purple)),
                    ),
                    Column(children: summry)
                  ]));
            }
          }());
    });
  }
}
