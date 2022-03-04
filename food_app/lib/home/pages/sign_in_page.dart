import 'package:aprilskuisine/base/custom_loader.dart';
import 'package:aprilskuisine/base/show_custom_message.dart';
import 'package:aprilskuisine/components/or_divider.dart';
import 'package:aprilskuisine/controllers/auth_controller.dart';

import 'package:aprilskuisine/home/pages/sign_up_page.dart';
import 'package:aprilskuisine/model/sign_in_model.dart';
import 'package:aprilskuisine/routes/routes_helper.dart';
import 'package:aprilskuisine/utils/colors.dart';
import 'package:aprilskuisine/utils/dimensions.dart';
import 'package:aprilskuisine/widgets/app_text_widget.dart';
import 'package:aprilskuisine/widgets/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isSigningIn = false;
  bool isRequest = false;
  final bool isLoginRequest = false;
  bool isNoVisiblePassword = true;

  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var signupImages = ["t.png", "f.png", "g.png"];

    void _login(AuthController authController) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
        showCustomSnackBar("Type in yourEmail address", title: "Email address");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in a valid Email address",
            title: "Valid emalid email address");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your Password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password can not be less than Six characters",
            title: "password");
      } else {
        SignInBody signInBody = SignInBody(
          email: email,
          password: password,
        );
        authController.login(signInBody).then((status) {
          if (status.isSucess) {
            Get.offNamed(RouteHelper.getCartPage());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (_authController) {
          return !_authController.isLoading
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: Dimensions.screenHeight * 0.10),
                      Center(
                        child: Container(
                          color: Colors.white,
                          child: const CircleAvatar(
                            radius: 100,
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage("assets/image/food.png"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.03,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: Dimensions.height15 * 3,
                            right: Dimensions.height15 * 3),
                        width: double.maxFinite,
                        // margin: EdgeInsets.only(left: Dimensions.width20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Kuisine!",
                                style: TextStyle(
                                    fontSize: Dimensions.font20 * 2,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Sign in to your account",
                                style: TextStyle(
                                  fontSize: Dimensions.font20 / 1.5,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(height: Dimensions.height30 / 2),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius30 / 2),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  offset: const Offset(1, 1),
                                  color: Colors.grey.withOpacity(0.3))
                            ]),
                        margin: EdgeInsets.only(
                            left: Dimensions.height15 * 3,
                            right: Dimensions.height15 * 3),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            contentPadding: const EdgeInsets.all(8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(),
                            ),
                            hintText: "aprilskuisine@gmail.com",
                            hintStyle: const TextStyle(
                                color: Colors.black, fontSize: 13),
                            prefixIcon: const Icon(Icons.email_outlined),
                          ),
                          obscureText: false,
                        ),
                      ),
                      // AppTextField(
                      //   hintText: "Email",
                      //   icon: Icons.phone_android,
                      //   textController: emailController,
                      //   color: Colors.black54,
                      // ),
                      SizedBox(height: Dimensions.height20),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius30 / 2),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  offset: const Offset(1, 1),
                                  color: Colors.grey.withOpacity(0.3))
                            ]),
                        margin: EdgeInsets.only(
                            left: Dimensions.height15 * 3,
                            right: Dimensions.height15 * 3),
                        child: TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                                color: Colors.black, fontSize: 13),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            contentPadding: const EdgeInsets.all(8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(),
                            ),
                            hintText: "*********",
                            hintStyle: const TextStyle(
                                color: Colors.black, fontSize: 13),
                            prefixIcon: const Icon(Icons.password_outlined),
                          ),
                          obscureText: true,
                        ),
                      ),
                      SizedBox(height: Dimensions.height20),
                      Row(
                        children: [
                          Expanded(child: Container()),
                          GestureDetector(
                            onTap: () {
                              Get.offNamed(RouteHelper.initial);
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.height15 * 3,
                                  right: Dimensions.height15 * 3),
                              child: Text(
                                " Forgot Password?",
                                style: TextStyle(
                                  fontSize: Dimensions.font20 / 1.7,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.02,
                      ),
                      GestureDetector(
                        onTap: () {
                          _login(_authController);
                        },
                        child: Container(
                          width: Dimensions.screenWidth / 3,
                          height: Dimensions.screenHeight / 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.radius30 / 2),
                              color: AppColors.mainColor),
                          child: Center(
                            child: BigText(
                                text: "Sign In",
                                size: Dimensions.font20 / 1.4,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.02,
                      ),
                      const OrDivider(color: Colors.black),
                      Wrap(
                        children: List.generate(
                          3,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: Dimensions.radius30 / 2.5,
                              backgroundImage: AssetImage(
                                  "assets/image/" + signupImages[index]),
                            ),
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Don\'t have an Account? ",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.font26 / 2,
                            ),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.to(
                                      () => const SignUpPage(),
                                      transition: Transition.fade),
                                text: "\Sign Up",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.mainBlackColor,
                                  fontSize: Dimensions.font20 / 1.2,
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                )
              : CustomLoader();
          ;
        }));
  }
}
