import 'package:flutter/material.dart';
import 'package:bmi/components/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton(this.onTab, this.buttonTitle);
  final Function onTab;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTab(),
      child: Container(
        decoration: new BoxDecoration(
            color: kBottomContainerColor,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0),
            )),
        child: Center(
            child: Text(
          buttonTitle,
          style: kLargeButtonTextStyle,
        )),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 5),
        height: kBottomContainerHeight,
      ),
    );
  }
}
