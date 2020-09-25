import 'package:bmi_calculator/Components/size_config.dart';
import 'package:bmi_calculator/Screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/bottom_button.dart';
import '../Components/gender_icon_widget.dart';
import '../Components/reusable_card.dart';
import '../Components/round_icon_button.dart';
import '../constants.dart';
import 'package:bmi_calculator/caculator_brain.dart';


enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  Gender gender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SizeConfig().init(context);
    print('Height:${SizeConfig.screenHeight}');
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        onPressed: () {
                          setState(() {
                            gender = Gender.male;
                          });
                        },
                        color: gender == Gender.male
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild:
                        GenderCard(gender: 'MALE', icon: FontAwesomeIcons.mars, ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPressed: () {
                          setState(() {
                            gender = Gender.female;
                          });
                        },
                        color: gender == Gender.female
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild: GenderCard(
                            gender: 'FEMALE', icon: FontAwesomeIcons.venus,),
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'HEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline
                                .alphabetic, //mandatory while using baseline
                            children: [
                              Text(
                                height.toString(),
                                style: kLabelNumberStyle,
                              ),
                              Text(
                                'cm',
                                style: kLabelTextStyle,
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15.0),
                                overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                                thumbColor: kBottomContainerColor,
                                activeTrackColor: kSliderActivColor,
                                overlayColor: Color(0x29EB1555)),
                            child: Slider(
                              value: height.toDouble(),
                              min: kMinHeight,
                              max: kMaxHeight,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              },
                              inactiveColor: kSliderInActivColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        color: kActiveCardColor,
                        cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'WEIGHT',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                weight.toString(),
                                style: kLabelNumberStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundActionButton(
                                    icon: FontAwesomeIcons.minus,
                                    functionality: () {
                                      setState(() {
                                        weight -= 1;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  RoundActionButton(
                                    icon: FontAwesomeIcons.plus,
                                    functionality: () {
                                      setState(() {
                                        weight += 5;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        color: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kLabelNumberStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundActionButton(
                                  icon: FontAwesomeIcons.minus,
                                  functionality: () {
                                    setState(() {
                                      age -= 1;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundActionButton(
                                  icon: FontAwesomeIcons.plus,
                                  functionality: () {
                                    setState(() {
                                      age += 5;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            BottomButton(buttonTitle: 'CALCULATE', onTap: () {
              CalculatorBrain cal = CalculatorBrain(height: height, weight: weight);

            Navigator.push(context, MaterialPageRoute(
              builder: (context)=> ResultsPage(
                  bmiResult: cal.calculateBMI(),
                  resultText: cal.getResult(),
                  interptText: cal.getInterpret())
            ),);


            },),
          ],
        ),
      ),
    );
  }
}
