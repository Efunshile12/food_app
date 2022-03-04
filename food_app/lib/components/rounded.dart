import 'package:flutter/material.dart';


class RoundedSocial extends StatelessWidget {
  final String text;
  final Function()? press;
  final Color color, textColor;

  IconData? icon;
  RoundedSocial({Key? key, 
    required this.text,
    required this.press,
    required this.color,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(10),
      width: size.width * 0.3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: const EdgeInsets.all(100),
          color: color,
          onPressed: press,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: textColor, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
