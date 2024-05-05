import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.ismale,
      required this.age,
      required this.result});

  final bool ismale;
  final int age;
  final double result;

  String get resultphares {
    String resultpha = "";
    if (result >= 30) {
      resultpha = "obese";
    } else if (result >= 25 && result > 30) {
      resultpha = "overweight";
    } else if (result >= 18.5 && result < 25) {
      resultpha = "normal";
    } else if (result < 18.5) {
      resultpha = "thin";
    }
    return resultpha;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Rusult",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Gender:${ismale == true ? "male" : "female"}",
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            Text(
              "Result:${result.toStringAsFixed(1)}",
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            Text(
              "Healthiness:$resultphares",
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            Text(
              "age:$age",
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
