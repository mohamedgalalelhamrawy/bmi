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
  double heightval = 170;
  int weight = 70;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
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
        margin: const EdgeInsets.only(bottom: 15),
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
                onPressed: (){
              setState(() {
                Type == "weight" ? weight -- : age--;
              });
            },
            heroTag: Type == "weight" ? "weight--" : "age--",
            child: Icon(Icons.remove,color: Colors.white,),
            )  ,
            SizedBox(width: 10,),
            FloatingActionButton.small(
              backgroundColor: Colors.teal,
              onPressed: (){
              setState(() {
                Type == "weight" ? weight ++ : age++;
              });
            },
            heroTag: Type == "weight" ? "weight++" : "age++",
            child: Icon(Icons.add,color: Colors.white,),
            )    
            ],
           )
          ],
        ),
      ),
    );
  }
}


 