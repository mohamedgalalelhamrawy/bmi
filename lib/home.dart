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
  double weight = 70;
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Body Mass Index",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ) ,
      body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
          Expanded(
            child: Row( children: [
              m1expanded(context,"male"),
              SizedBox(width: 15,),
              m1expanded(context,"female"),
            ],),
          )
        ],),
      ),
    );
  }

  Expanded m1expanded(BuildContext context ,String Type ) {
    return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  ismale = Type=="male" ?true : false;
                });
              },
              child: Container( 
                decoration: BoxDecoration(
                     color: (Type=="male" && ismale == true) || (Type=="female" && ismale== false) ? Colors.teal : Colors.blueGrey,
                     borderRadius: BorderRadius.circular(8)
                ),
                padding: EdgeInsets.symmetric(vertical: 15), 
                margin: EdgeInsets.symmetric(vertical: 15),  
                child: Column(
                children: [
                  Icon(Type=="male" ? Icons.male : Icons.female,size: 70,color: Colors.white,),
                  SizedBox(height: 8,),
                  Text(Type=="male" ?"Male" : "Female",style: Theme.of(context).textTheme.labelMedium,)
                ],
              ),),
            ),
          );
  }
}