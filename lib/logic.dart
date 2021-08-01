import 'dart:math';

class CalculateBMI {
  double weight, height, ans;
  CalculateBMI({this.height, this.weight});

  String calculateValue() {
    ans = weight / (pow((height / 100), 2));
    return ans.toStringAsFixed(1);
  }

  List Result() {
    List l = List();
    if (ans >= 25) {
      l.add("Overweight");
      l.add("You have a higher than normal weight. Try exercising more.");
      return l;
    } else if (ans > 18.5) {
      l.add("Normal");
      l.add("You have a normal weight. Good job!");
      return l;
    } else {
      l.add("Underweight");
      l.add(
          "You have a lower than normal body weight. You can eat a bit more.");
      return l;
    }
  }
}
