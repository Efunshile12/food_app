import 'package:aprilskuisine/components/const.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function()? press;
  final Color color, textColor;
  const RoundedButton({
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: FlatButton(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
                color: textColor, fontSize: 14, fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
