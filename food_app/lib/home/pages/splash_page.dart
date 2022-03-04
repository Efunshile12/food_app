import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:aprilskuisine/components/const.dart';
import 'package:aprilskuisine/controllers/popular_product_list.dart';
import 'package:aprilskuisine/controllers/recommended_product_controller.dart';
import 'package:aprilskuisine/routes/routes_helper.dart';
import 'package:aprilskuisine/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResources() async {
    await Get.find<RecommendedProductController>().getRecommendedProductList();
    await Get.find<PopularProductController>().getPopularProductList();
  }

  @override
  void initState() {
    super.initState();
    _loadResources();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(const Duration(seconds: 3),
        () => Get.offNamed(RouteHelper.getWelcomepage()));
  }

  Shader linearGradient = const LinearGradient(colors: [
    googleColor,
    Colors.green,
    Colors.green,
  ]).createShader(const Rect.fromLTWH(0, 0, 200, 70));
  final colorizedColors = [
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];
  final colorizedTextStyle = const TextStyle(
      fontSize: 25.0, fontFamily: 'Sail', fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                'assets/image/food.png',
                width: Dimensions.splashimg,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: Dimensions.splashimg,
              child: AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    "April's Kuisine",
                    textStyle: colorizedTextStyle,
                    colors: colorizedColors,
                  ),
                ],
                isRepeatingAnimation: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
