import 'package:aprilskuisine/components/const.dart';
import 'package:flutter/material.dart';

class RoundedSocial extends StatelessWidget {
  final String text;
  final Function()? press;
  final Color color, textColor;

  IconData? icon;
  RoundedSocial({
    required this.icon,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(5),
      width: size.width * 0.23,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FlatButton(
          padding: const EdgeInsets.all(5),
          color: color,
          onPressed: press,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
