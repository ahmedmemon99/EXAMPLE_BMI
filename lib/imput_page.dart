import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'result_page.dart';
import 'calculator_brain.dart';

//const activeCardColour = Colors.red;
//const inactiveCardColour=Colors.grey;
const bottomContainerColour = Colors.blueAccent;

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  int height = 180;
  int weight = 40;
  int age = 20;
  //1 for male 0 for female

/*  void updateColour(Gender selectedGender)
  {
    if(selectedGender==Gender.male)
      {
        if(maleCardColour==Colors.red)
          {
            maleCardColour=Colors.grey;
            femaleCardColour=Colors.red;
          }
        else
          {
            maleCardColour=Colors.red;
            femaleCardColour=Colors.grey;
          }
  }
    else
      {
        if(femaleCardColour==Colors.red)
        {
          femaleCardColour=Colors.grey;
          maleCardColour=Colors.red;
      }
        else
        {
          femaleCardColour=Colors.red;
          maleCardColour=Colors.grey;
        }
        }
}
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey,
      appBar: AppBar(
        //backgroundColor: Colors.orange,
        //foregroundColor: Colors.orange.shade900,
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          //first row expanded widget
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    pressedMe: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? Colors.black
                        : Colors.grey,
                    cardChild: iconContent(
                      label: 'Male',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    pressedMe: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? Colors.black
                        : Colors.grey,
                    cardChild: iconContent(
                      label: 'Female',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),

          //second row expanded widget
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: Colors.grey,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HEIGHT",
                          style: klabelTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: klabelTextStyle2,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'cm',
                              style: klabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            //overlayColor: Colors.green,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 25.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: sliderMinValue,
                            max: sliderMaxValue,
                            //activeColor: Colors.pink,
                            inactiveColor: Colors.black,

                            onChanged: (double value) {
                              setState(() {
                                height = value.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //third row Expanded widget
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    pressedMe: () {},
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: klabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: klabelTextStyle2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
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
                    colour: Colors.grey,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    pressedMe: () {},
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: klabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: klabelTextStyle2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
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
                    colour: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          BottomButton(
            buttonTitle: 'Calculate',
            onTap: (){

              CalculatorBrain c=CalculatorBrain(height: height,weight: weight);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultPage(
                    emi_value:c.calculateBMI(),
                    emi_advice: c.adviceMessage(),
                    emi_status: c.getResult(),

                  )));
            },
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {

  BottomButton({required this.onTap,required this.buttonTitle});

  final void Function()? onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Center(
          child: Text(
            buttonTitle,
            style: kbottomTextStyle,
          ),
        ),
        color: bottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kbottomcontainerheight,
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      fillColor: Colors.grey.shade600,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
