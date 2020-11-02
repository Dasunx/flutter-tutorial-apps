import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/round_icon_button.dart';
import 'package:bmi_calculator/caculator_brain.dart';
import 'package:easy_localization/easy_localization.dart';

enum genderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  genderType selectedGender;
  int height = 160;
  int weight = 60;
  int age = 24;
  String local;

  @override
  void changeLocale(String locale) {
    EasyLocalization.of(context).locale = Locale(locale);
  }

  List<String> languages = <String>['si', 'en', 'es'];

  Widget build(BuildContext context) {
    local = EasyLocalization.of(context).locale.toString();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'title',
            style: TextStyle(fontSize: 32.0),
          ).tr(context: context),
          actions: [
            PopupMenuButton(
                color: Color(0xFF1D1E3D),
                onSelected: changeLocale,
                itemBuilder: (BuildContext context) {
                  // return languages.map((element) {
                  //   return PopupMenuItem(
                  //     child: Text(element),
                  //     value: element,
                  //   );
                  // }).toList();
                  return [
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            child: Image.network(
                                "https://raw.githubusercontent.com/hjnilsson/country-flags/master/png250px/lk.png"),
                          ),
                          Spacer(),
                          Text(
                            'isx',
                            style: TextStyle(
                                fontFamily: 'SAMADI',
                                fontSize: 20,
                                color:
                                    local == 'si' ? Colors.red : Colors.white),
                          ),
                        ],
                      ),
                      value: 'si',
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            child: Image.network(
                                "https://raw.githubusercontent.com/hjnilsson/country-flags/master/png250px/us.png"),
                          ),
                          Spacer(),
                          Text(
                            'En',
                            style: TextStyle(
                                fontFamily: 'JOHN',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color:
                                    local == 'en' ? Colors.red : Colors.white),
                          ),
                        ],
                      ),
                      value: 'en',
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            child: Image.network(
                                "https://raw.githubusercontent.com/hjnilsson/country-flags/master/png250px/es.png"),
                          ),
                          Spacer(),
                          Text(
                            'Es',
                            style: TextStyle(
                                fontFamily: 'JOHN',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color:
                                    local == 'es' ? Colors.red : Colors.white),
                          ),
                        ],
                      ),
                      value: 'es',
                    )
                  ];
                })
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = genderType.male;
                        });
                      },
                      color1: selectedGender == genderType.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'male'.tr(),
                        color: selectedGender == genderType.male
                            ? kActiveIconColor
                            : Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = genderType.female;
                        });
                      },
                      color1: selectedGender == genderType.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'female'.tr(),
                        color: selectedGender == genderType.female
                            ? kActiveIconColor
                            : Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color1: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'height'.tr(),
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          'cm'.tr(),
                          style: kLabelTextStyle,
                        ),
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.red,
                        thumbColor: Color(0xffEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 50.0,
                        max: 220.0,
                        inactiveColor: Colors.white,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color1: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'weight'.tr(),
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color1: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'age'.tr(),
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            BottomButton(
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(weight: weight, height: height);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      interpretation: calc.getInterpretation(),
                      resultText: calc.getResult(),
                    ),
                  ),
                );
              },
              buttonTitle: 'cal'.tr(),
            ),
          ],
        ));
  }
}
