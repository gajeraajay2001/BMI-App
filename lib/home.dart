import 'package:bmi_app/logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation translateAnimationWeight;
  Animation translateAnimationHeight;
  Animation translateAnimationAge;
  Animation translateAnimationTitle;
  Animation translateAnimationButton;
  double _weightValue = 55;
  double _heightValue = 180;
  String ans;
  double _age = 24;

  Widget _slider(
    context,
    String name1,
    String name2,
    double _start,
    double _end,
    double _width,
    double _textsize,
    double _type,
  ) {
    return Column(
      children: [
        SleekCircularSlider(
          initialValue: _start,
          max: _end,
          appearance: CircularSliderAppearance(
              size: MediaQuery.of(context).size.width - _width),
          innerWidget: (val) {
            return Center(
              child: Text(
                "${val.toInt().toString()} $name1 ",
                style: TextStyle(
                  fontSize: _textsize,
                  color: Colors.deepPurple,
                ),
              ),
            );
          },
          onChange: (val) {
            setState(() {
              if (_type == 1)
                _weightValue = val;
              else if (_type == 2)
                _heightValue = val;
              else
                _age = val;
              // print(
              //     " Weight := $_weightValue \n Height := $_heightValue \n Age := $_age ");
            });
          },
        ),
        Container(
          child: Text(
            name2,
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 20,
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepPurple),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.all(10),
        ),
      ],
    );
  }

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    translateAnimationWeight =
        Tween<Offset>(begin: Offset(-300, 0), end: Offset(0, 0))
            .animate(controller);
    translateAnimationHeight =
        Tween<Offset>(begin: Offset(-100, 0), end: Offset(0, 0))
            .animate(controller);
    translateAnimationAge =
        Tween<Offset>(begin: Offset(120, 0), end: Offset(0, 0))
            .animate(controller);
    translateAnimationTitle =
        Tween<Offset>(begin: Offset(0, -200), end: Offset(0, 0))
            .animate(controller);
    translateAnimationButton =
        Tween<Offset>(begin: Offset(0, 100), end: Offset(0, 0))
            .animate(controller);
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("asset/images/wall.jpg"),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.translate(
                offset: translateAnimationTitle.value,
                child: Container(
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
                        "BMI CALCULATOR",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 29,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Transform.translate(
                  offset: translateAnimationWeight.value,
                  child: _slider(context, "Kg", "Weight", 55, 200, 180, 25, 1),
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Transform.translate(
                        offset: translateAnimationHeight.value,
                        child: _slider(
                            context, "cm", "Height", 180, 260, 240, 18, 2),
                      ),
                    ),
                    Expanded(
                      child: Transform.translate(
                          offset: translateAnimationAge.value,
                          child: _slider(
                              context, "Year", "Age", 22, 100, 240, 18, 3)),
                    ),
                  ],
                ),
              ),
              Transform.translate(
                offset: translateAnimationButton.value,
                child: InkWell(
                  onTap: () {
                    String a1, a2;
                    setState(() {
                      List l = List();
                      CalculateBMI BMI = CalculateBMI(
                          weight: _weightValue, height: _heightValue);
                      ans = BMI.calculateValue();
                      l = BMI.Result();
                      a1 = l[0];
                      a2 = l[1];
                    });
                    Navigator.of(context).pushNamed(
                      'result/',
                      arguments: [ans, a1, a2],
                    );
                  },
                  child: Container(
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
                      "CALCULATE",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 29,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
