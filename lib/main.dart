import 'package:bmi/home.dart';
import 'package:bmi/resultpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Bmi());
}

class Bmi extends StatelessWidget {
  const Bmi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      theme: ThemeData( 
        primaryColor: Colors.teal,
        canvasColor: Colors.black,
        textTheme: const TextTheme( 
            labelMedium:TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold,)
        )
      ),
      // home:  HomePage(),
      home: ResultPage(age: 26,ismale: true,result: 18.4,),
    );
  }
}