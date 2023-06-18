import 'package:flutter/material.dart';
import 'constants.dart';

//ignore: must_be_immutable
class mainCard extends StatelessWidget {
  mainCard({
    super.key,
    required this.writtenText,
    required this.mainWidget,
    this.currentColor
  });

  Color? currentColor;
  final String writtenText;
  final Widget mainWidget;

  @override

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          mainWidget,
          Text(writtenText,style: TextStyle(
            fontSize: 20
          ),)
        ],
      ),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(color: currentColor,
          borderRadius: BorderRadius.all(Radius.circular(5))
      ),
    );
  }
}

class lastButton extends StatelessWidget {
  const lastButton({
    super.key,
    required this.writtenText
  });

  final String writtenText;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xFFF83058),
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: Center(
          child: Text(writtenText,style:
          TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
              letterSpacing: 3
          ),
          ),
        ));
  }
}
