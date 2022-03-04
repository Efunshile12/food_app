import 'package:aprilskuisine/controllers/popular_product_list.dart';
import 'package:aprilskuisine/controllers/recommended_product_controller.dart';
import 'package:aprilskuisine/home/pages/food_page_body.dart';
import 'package:aprilskuisine/utils/colors.dart';
import 'package:aprilskuisine/utils/dimensions.dart';
import 'package:aprilskuisine/widgets/big_text.dart';
import 'package:aprilskuisine/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: Dimensions.height45,
                  bottom: Dimensions.height15,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              BigText(
                                  text: 'Nigeria',
                                  color: AppColors.mainColor,
                                  size: Dimensions.height20),
                              Row(
                                children: [
                                  SmallText(
                                      text: 'Lagos', color: Colors.black54),
                                  const Icon(Icons.arrow_drop_up_rounded),
                                ],
                              ),
                            ],
                          ),
                          Center(
                            child: Container(
                              child: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius15),
                                color: AppColors.mainColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(
                child: SingleChildScrollView(
                  child: FoodPage(),
                ),
              )
            ],
          ),
          onRefresh: _loadResource),
    );
  }
}
