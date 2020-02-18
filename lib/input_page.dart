import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;
  int height = 180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            gender = Gender.male;
                          });
                        }, //This is widget to get the gestures
                        child: ReusableCard(
                          colour: gender == Gender.male
                              ? kactiveCardColor
                              : kinactiveCardColour,
                          cardChild: IconContent(
                            icon: FontAwesomeIcons.mars,
                            label: 'MALE',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = Gender.female;
                        });
                      },
                      child: ReusableCard(
                        colour: gender == Gender.female
                            ? kactiveCardColor
                            : kinactiveCardColour,
                        cardChild: IconContent(
                            icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                      ),
                    ))
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: Colors.deepPurple.shade900,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: klabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(height.toString(), style: knumberTextStyle),
                          Text(
                            'cm',
                            style: klabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius:20.0)
                        ),
                                        child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            activeColor: Colors.white,
                            inactiveColor: Colors.grey,
                            onChanged: (double newVal){
                              setState(() {
                                height= newVal.round();
                              });
                            }),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(colour: kactiveCardColor),
                    ),
                    Expanded(
                      child: ReusableCard(colour: kactiveCardColor),
                    )
                  ],
                ),
              ),
              Container(
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: kbottomContainerHeight,
              )
            ]));
  }
}
