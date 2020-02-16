import 'package:flutter/material.dart';
import 'input_page.dart';
void main() => runApp(BMI());

class BMI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
         primaryColor: Color(0xFF282C4F),
        scaffoldBackgroundColor: Color(0xFF282C4F), 
      ),
      debugShowCheckedModeBanner: false,
      home: InputPage()
    );
  }
}



