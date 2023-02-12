import 'package:flutter/material.dart';
import 'package:practise_day1/constants.dart';
import 'reusable_card.dart';
import 'imput_page.dart';

class ResultPage extends StatelessWidget {
  @override
  String emi_value,emi_status,emi_advice;

  ResultPage({required this.emi_advice,required this.emi_status,required this.emi_value});


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              //color: Colors.green,
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'RE CALCULATE',
                style: ktitletextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: Colors.grey,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    emi_status,
                    style: kresulttextStyle,
                  ),
                  Text(
                    emi_value,
                    style: kbmitextStyle,
                  ),
                  Text(
                    emi_advice,
                    textAlign: TextAlign.center,
                    style: kbmiadviceStyle,
                  ),
                ],
              ),
            ),
          ),

          BottomButton(
            buttonTitle: 'Re-Calculate',
            onTap: (){
              Navigator.pop(context);
            },
          )
        ],
      ),

    );
  }
}
