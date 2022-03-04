import 'package:aprilskuisine/utils/dimensions.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  Color? color;
  String text;
  double size;
  TextOverflow overFlow;
  BigText({
    Key? key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.overFlow = TextOverflow.ellipsis,
    this.size = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: size == 0 ? Dimensions.font20 : size,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
