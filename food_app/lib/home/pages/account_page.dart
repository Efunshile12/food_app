import 'package:aprilskuisine/base/custom_loader.dart';
import 'package:aprilskuisine/controllers/auth_controller.dart';
import 'package:aprilskuisine/controllers/cart_controller.dart';
import 'package:aprilskuisine/controllers/user_controller.dart';
// import 'package:aprilskuisine/home/pages/sign_in_page.dart';
import 'package:aprilskuisine/routes/routes_helper.dart';
import 'package:aprilskuisine/utils/colors.dart';
import 'package:aprilskuisine/utils/dimensions.dart';
import 'package:aprilskuisine/widgets/App_icons.dart';
import 'package:aprilskuisine/widgets/accountWidget.dart';
import 'package:aprilskuisine/widgets/big_text.dart';
import 'package:aprilskuisine/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    bool _userLogged = Get.find<AuthController>().userLogged();
    if (_userLogged) {
      Get.find<UserController>().getUserInfo();
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: SmallText(
          size: 20,
          color: Colors.white,
          text: 'Profile',
        ),
      ),
      body: GetBuilder<UserController>(builder: (userController) {
        return _userLogged
            ? (userController.isLoading
                ? Container(
                    width: double.maxFinite,
                    color: Colors.white,
                    margin: EdgeInsets.only(top: Dimensions.height20),
                    child: Column(children: [
                      AppIcon(
                        icon: (Icons.person),
                        backgroundColor: AppColors.mainColor,
                        iconSize: Dimensions.height45 * 2,
                        size: Dimensions.height15 * 10,
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(children: [
                            AccountPageWidget(
                              appIcon: AppIcon(
                                icon: (Icons.person),
                                backgroundColor: AppColors.mainColor,
                                iconSize: Dimensions.height10 * 5 / 2,
                                size: Dimensions.height10 * 5,
                              ),
                              bigText:
                                  BigText(text: userController.userModel.name),
                            ),
                            SizedBox(
                              height: Dimensions.height30,
                            ),
                            AccountPageWidget(
                              appIcon: AppIcon(
                                icon: (Icons.phone_android),
                                backgroundColor: AppColors.yellowColor,
                                iconSize: Dimensions.height10 * 5,
                                size: Dimensions.height10 * 5,
                              ),
                              bigText:
                                  BigText(text: userController.userModel.phone),
                            ),
                            SizedBox(
                              height: Dimensions.height30,
                            ),
                            AccountPageWidget(
                              appIcon: AppIcon(
                                icon: (Icons.email_outlined),
                                backgroundColor: AppColors.yellowColor,
                                iconSize: Dimensions.height10 * 5 / 2,
                                size: Dimensions.height10 * 5,
                              ),
                              bigText:
                                  BigText(text: userController.userModel.email),
                            ),
                            SizedBox(
                              height: Dimensions.height30,
                            ),
                            AccountPageWidget(
                              appIcon: AppIcon(
                                icon: (Icons.message_outlined),
                                backgroundColor: AppColors.yellowColor,
                                iconSize: Dimensions.height10 * 5 / 2,
                                size: Dimensions.height10 * 5,
                              ),
                              bigText: BigText(text: "Messages"),
                            ),
                            SizedBox(
                              height: Dimensions.height30,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (Get.find<AuthController>().userLogged()) {
                                  Get.find<AuthController>().clearSharedData();
                                  Get.find<CartController>().clear();
                                  Get.find<CartController>().clearCartHistory();
                                  Get.offNamed(RouteHelper.getSignInPage());
                                }
                              },
                              child: AccountPageWidget(
                                appIcon: AppIcon(
                                  icon: Icons.logout_outlined,
                                  backgroundColor: Colors.redAccent,
                                  iconSize: Dimensions.height10 * 5 / 2,
                                  size: Dimensions.height10 * 5,
                                ),
                                bigText: BigText(text: "LogOut"),
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height30,
                            ),
                          ]),
                        ),
                      ),
                    ]),
                  )
                : const CustomLoader())
            : GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHelper.getSignInPage());
                },
                child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.maxFinite,
                          height: Dimensions.height20 * 8,
                          margin: EdgeInsets.only(
                              left: Dimensions.width20,
                              right: Dimensions.width20),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  "assets/image/signintocontinue.png"),
                            ),
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          height: Dimensions.height30,
                          margin: EdgeInsets.only(
                              left: Dimensions.width20 / 2,
                              right: Dimensions.width20 / 2),
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                          ),
                          child: Center(
                              child: BigText(
                                  text: "Sign in",
                                  color: Colors.white,
                                  size: Dimensions.height20 / 1.5)),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }
}
