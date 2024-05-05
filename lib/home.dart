import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Body Mass Index",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ) ,
    );
  }
}