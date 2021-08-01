import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    final List<String> ans = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("asset/images/wall.jpg"),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 130,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffa7469d),
                      Color(0xff5e70f1).withOpacity(0.8),
                    ],
                    begin: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(150),
                    bottomRight: Radius.circular(150),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 56),
                    Text(
                      "YOUR RESULT",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 29,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              CircularPercentIndicator(
                radius: 215,
                lineWidth: 17,
                percent: double.parse(ans[0]) * 3 / 100 > 1
                    ? 1.0
                    : double.parse(ans[0]) * 3 / 100,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.purple,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ans[0],
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ans[1],
                      style: TextStyle(
                        color: Color(0xff5e70f1),
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                footer: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    ans[2],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff5e70f1),
                      fontWeight: FontWeight.w600,
                      fontSize: 17.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  alignment: Alignment.center,
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffa7469d),
                        Color(0xff5e70f1).withOpacity(0.8),
                      ],
                      begin: Alignment.topRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[600],
                        blurRadius: 10,
                        offset: Offset(5, 5),
                      )
                    ],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    "RE-CALCULATE",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 29,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
