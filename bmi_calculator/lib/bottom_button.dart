import 'package:flutter/material.dart';

import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.onTap, this.buttonTitle});

  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        decoration: BoxDecoration(
            color: kBottomContainerColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
