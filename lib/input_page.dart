import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const inactiveCardColour = Color(0xFFEB1555);
const activeCardColor = Color(0XFF776776);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCardColour;
  Color femaleCardColour = inactiveCardColour;

  void updateColour(int gender) {
    if (gender == 1) {
      if (maleCardColour == inactiveCardColour) {
        maleCardColour = activeCardColor;
        femaleCardColour = inactiveCardColour;
      } else {
        maleCardColour = inactiveCardColour;
      }
    }

    if (gender == 2) {
      if (femaleCardColour == inactiveCardColour) {
        femaleCardColour = activeCardColor;
        maleCardColour = inactiveCardColour;
      } else {
        femaleCardColour = inactiveCardColour;
      }
    }
  }

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
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(1);
                      });
                    }, //This is widget to get the gestures
                    child: ReusableCard(
                      colour: maleCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: (){setState(() {
                    updateColour(2);
                  });},
                  child: ReusableCard(
                    colour: femaleCardColour,
                    cardChild: IconContent( 
                        icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                  ),
                ))
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
            ),
          ),
          Container(
            color: Color(0xFFEB1555),
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ]));
  }
}
