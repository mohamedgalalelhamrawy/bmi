
import 'dart:math';

import 'package:bmi/resultpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ismale = true;
  int age = 20;
  double heightvalue = 170;
  int weight = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Body Mass Index",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  m1expanded(context, "male"),
                  const SizedBox(
                    width: 15,
                  ),
                  m1expanded(context, "female"),
                ],
              ),
            ),
            // /////////////////////////////////
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(heightvalue.toStringAsFixed(1),
                          style: Theme.of(context).textTheme.headlineLarge),
                      Text(
                        "CM",
                        style: Theme.of(context).textTheme.labelMedium,
                      )
                    ],
                  ),
                  Slider(
                    activeColor: Colors.teal ,
                    min: 130,
                    max: 220,
                    value: heightvalue, onChanged: (double newvalue){
                      setState(() {
                        heightvalue = newvalue;
                      });
                  })
                ],
              ),
            )),
            // /////////////////////////////////
            Expanded(
              child: Row(
                children: [
                  m2expanded(context, "weight"),
                  const SizedBox(
                    width: 15,
                  ),
                  m2expanded(context, "age"),
                ],
              ),
            ), 
            // ///////////////////////////button
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ResultPage(ismale: ismale, age: age, result: weight/pow(heightvalue/100, 2));
                }));
              },
              child: Container( 
                margin: EdgeInsets.only(bottom: 10),
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8),
                color: Colors.teal,
                child: Center(
                  child: Text("Calculate",style: TextStyle(
                    color: Colors.white,fontSize: 22,
                    
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded m1expanded(BuildContext context, String Type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            ismale = Type == "male" ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: (Type == "male" && ismale == true) ||
                      (Type == "female" && ismale == false)
                  ? Colors.teal
                  : Colors.blueGrey,
              borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 15),
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              Icon(
                Type == "male" ? Icons.male : Icons.female,
                size: 70,
                color: Colors.white,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                Type == "male" ? "Male" : "Female",
                style: Theme.of(context).textTheme.labelMedium,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2expanded(BuildContext context, String Type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 15),
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            Text(
              Type == "weight" ? "Weight" : "Age",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(Type == "weight" ? weight.toString() : age.toString(),
                style: Theme.of(context).textTheme.headlineLarge),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.small(
                  backgroundColor: Colors.teal,
                  onPressed: () {
                    setState(() {
                      Type == "weight" ? weight-- : age--;
                    });
                  },
                  heroTag: Type == "weight" ? "weight--" : "age--",
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                FloatingActionButton.small(
                  backgroundColor: Colors.teal,
                  onPressed: () {
                    setState(() {
                      Type == "weight" ? weight++ : age++;
                    });
                  },
                  heroTag: Type == "weight" ? "weight++" : "age++",
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
