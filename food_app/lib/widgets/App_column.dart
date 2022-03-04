import 'package:aprilskuisine/utils/colors.dart';
import 'package:aprilskuisine/utils/dimensions.dart';
import 'package:aprilskuisine/widgets/big_text.dart';
import 'package:aprilskuisine/widgets/icon_and_text_widget.dart';
import 'package:aprilskuisine/widgets/small_text.dart';
import 'package:flutter/material.dart';

class AppColumn extends StatelessWidget {
  final String text;
   AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: text, size: Dimensions.font26),
          SizedBox(height: Dimensions.height10),
          Row(
            children: [
              Wrap(
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star,
                    size: Dimensions.height12,
                    color: AppColors.mainColor,
                  ),
                ),
              ),
              SizedBox(width: Dimensions.width10),
              SmallText(text: '4.5'),
              SizedBox(width: Dimensions.width10),
              SmallText(text: '1287'),
              SizedBox(width: Dimensions.width10),
              SmallText(
                text: 'comments',
              ),
            ],
          ),
          SizedBox(height: Dimensions.height20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              IconAndTextWidget(
                  icon: Icons.circle_sharp,
                  text: 'Normal',
                  iconColor: AppColors.iconColor1),
              IconAndTextWidget(
                  icon: Icons.location_on,
                  text: '32mins',
                  iconColor: AppColors.mainColor),
              IconAndTextWidget(
                  icon: Icons.access_time_rounded,
                  text: 'Normal',
                  iconColor: AppColors.iconColor2),
            ],
          ),
        ],
      ),
    );
  }
}
