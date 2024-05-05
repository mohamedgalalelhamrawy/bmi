import 'package:bmi/home.dart';
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
        textTheme: TextTheme( 

        )
      ),
      home:  HomePage(),
    );
  }
}