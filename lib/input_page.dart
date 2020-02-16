import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: Colors.blue,
                  ),
                ),
                Expanded(
                  child: ReusableCard(colour: Colors.blue),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: Colors.red,
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(colour: Colors.blue),
              ),
              Expanded(
                child: ReusableCard(colour: Colors.blue),
              )
            ],
          ))
        ]));
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour});
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)));
  }
}
