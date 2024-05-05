import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Body Mass Index",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ) ,
      body: Column(
        children: [
        Expanded(
          child: Row( children: [
            Expanded(
              child: Container( 
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                color: Colors.teal,
                child: Column(
                children: [
                  Icon(Icons.male,size: 50,color: Colors.white,),
                  SizedBox(height: 8,),
                  Text("Male",style: Theme.of(context).textTheme.labelMedium,)
                ],
              ),),
            )
          ],),
        )
      ],),
    );
  }
}