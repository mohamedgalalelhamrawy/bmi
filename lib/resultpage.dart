


import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Rusult",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ) ,
    );
  }
}