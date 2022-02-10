import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pie_chart/pie_chart.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 0,
    "Xamarin": 0,
    "Ionic": 0,
  };
  String budget = "0";
  bool _show = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
      ),
      backgroundColor: Colors.black26,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(25.w, 15.h, 0, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Your Spends",
                style: TextStyle(color: Colors.white, fontSize: 18.sp),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(23.w, 15.h, 21.w, 0),
            width: double.infinity,
            height: 377.h,
            padding: EdgeInsets.fromLTRB(25.w, 15.h, 25.w, 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xff262626)),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Row(children: [
                    Text("₹10000",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5.h, 0, 0),
                      child: Text("/ " + budget,
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.sp)),
                    ),
                    IconButton(
                        onPressed: () {
                          _showModalBottomSheet();
                        },
                        icon: Icon(
                          Icons.create,
                          color: Colors.red,
                        )),
                  ]),
                  SizedBox(
                    height: 22.h,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xff3A3A3A)),
                      height: 228.h,
                      width: double.infinity,
                      child: PieChart(
                        dataMap: dataMap,

                        animationDuration: Duration(milliseconds: 800),

                        chartLegendSpacing: 32,

                        chartRadius: MediaQuery.of(context).size.width / 3.2,

                        colorList: [
                          Colors.black,
                          Colors.yellow,
                          Colors.red,
                          Colors.purple
                        ],

                        initialAngleInDegree: 0,

                        chartType: ChartType.ring,

                        ringStrokeWidth: 32,

                        centerText: "HYBRID",

                        legendOptions: LegendOptions(
                          showLegendsInRow: false,
                          legendPosition: LegendPosition.right,
                          showLegends: true,
                          legendShape: BoxShape.circle,
                          legendTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        chartValuesOptions: ChartValuesOptions(
                          showChartValueBackground: true,
                          showChartValues: true,
                          showChartValuesInPercentage: false,
                          showChartValuesOutside: false,
                          decimalPlaces: 1,
                        ),

                        // gradientList: ---To add gradient colors---

                        // emptyColorGradient: ---Empty Color gradient---
                      )),
                  SizedBox(
                    height: 22.h,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff3A3A3A)),
                    ),
                    onPressed: () {},
                    child: Text("See Detailed Summary",
                        style: TextStyle(fontSize: 18.sp)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showModalBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.black54,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
            child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          color: Colors.black26,
          child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 30.h, 20.w, 30.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Set Monthly Budget",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white)),
                      Expanded(flex: 3, child: SizedBox()),
                      TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black54)),
                          onPressed: () {},
                          child:
                              Text("Clear", style: TextStyle(fontSize: 18.sp)))
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text("₹",
                        style: TextStyle(fontSize: 30.sp, color: Colors.white)),
                    /*TextField(
                        decoration: InputDecoration(
                      hintText: budget,
                      hintStyle: TextStyle(fontSize: 18.sp),
                    )),*/
                  ]),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.purple)),
                          onPressed: () {},
                          child: Text("Set",
                              style: TextStyle(
                                  fontSize: 18.sp, color: Colors.white))),
                      Expanded(flex: 3, child: SizedBox()),
                      TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black26)),
                          onPressed: () {},
                          child: Text("Cancel",
                              style: TextStyle(
                                  fontSize: 18.sp, color: Colors.purple))),
                    ],
                  )
                ],
              )),
        ));
      },
    );
  }
}
