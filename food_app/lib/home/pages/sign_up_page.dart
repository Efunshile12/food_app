import 'package:aprilskuisine/base/custom_loader.dart';
import 'package:aprilskuisine/base/show_custom_message.dart';
import 'package:aprilskuisine/controllers/auth_controller.dart';
import 'package:aprilskuisine/home/pages/sign_in_page.dart';
import 'package:aprilskuisine/model/sign_up_model.dart';
import 'package:aprilskuisine/routes/routes_helper.dart';
import 'package:aprilskuisine/utils/colors.dart';
import 'package:aprilskuisine/utils/dimensions.dart';
import 'package:aprilskuisine/widgets/app_text_widget.dart';
import 'package:aprilskuisine/widgets/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signupImages = ["t.png", "f.png", "g.png"];

    void _registration(AuthController authController) {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar("Type in your name", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Type in your Phone number", title: "Phone number");
      } else if (email.isEmpty) {
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
        showCustomSnackBar("All went well", title: "Perfect");

        SignUpBody signUpBody = SignUpBody(
            name: name, phone: phone, password: password, email: email);
        authController.registration(signUpBody).then((status) {
          if (status.isSucess) {
            print("successful registration");
            Get.offNamed(RouteHelper.signInPage);
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
                      SizedBox(height: Dimensions.screenHeight * 0.15),
                      Center(
                        child: Container(
                          color: Colors.white,
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 100,
                            backgroundImage:
                                AssetImage("assets/image/food.png"),
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.height30),
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
                            hintText: "Email",
                            hintStyle: const TextStyle(
                                color: Colors.black, fontSize: 13),
                            prefixIcon: const Icon(Icons.email_outlined),
                          ),
                          obscureText: false,
                        ),
                      ),
                      // AppTextField(
                      //   hintText: "Email",
                      //   icon: Icons.email,
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
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            contentPadding: const EdgeInsets.all(8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(),
                            ),
                            hintText: "password",
                            hintStyle: const TextStyle(
                                color: Colors.black, fontSize: 13),
                            prefixIcon: const Icon(Icons.password_outlined),
                          ),
                          obscureText: true,
                        ),
                      ),
                      // AppTextField(
                      //   hintText: "password",
                      //   icon: Icons.password_sharp,
                      //   isObscured: true,
                      //   textController: passwordController,
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
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            contentPadding: const EdgeInsets.all(8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(),
                            ),
                            hintText: "Name",
                            hintStyle: const TextStyle(
                                color: Colors.black, fontSize: 13),
                            prefixIcon: const Icon(Icons.person),
                          ),
                          obscureText: false,
                        ),
                      ),
                      // AppTextField(
                      //   hintText: "Name",
                      //   icon: Icons.person,
                      //   textController: nameController,
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
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            contentPadding: const EdgeInsets.all(8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(),
                            ),
                            hintText: "phone",
                            hintStyle: const TextStyle(
                                color: Colors.black, fontSize: 13),
                            prefixIcon: const Icon(Icons.phone_android),
                          ),
                          obscureText: false,
                        ),
                      ),
                      // AppTextField(
                      //     hintText: "Phone",
                      //     icon: Icons.phone,
                      //     textController: phoneController,
                      //     color: Colors.black54),
                      // SizedBox(height: Dimensions.height20),
                      SizedBox(height: Dimensions.height20),
                      GestureDetector(
                        onTap: () {
                          _registration(_authController);
                        },
                        child: Container(
                          width: Dimensions.screenWidth / 3,
                          height: Dimensions.screenHeight / 20,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius30),
                              color: AppColors.mainColor),
                          child: Center(
                            child: BigText(
                                text: "Sign Up",
                                size: Dimensions.font20 / 1.5,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Have an Account already?",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.font20 / 1.2,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.back()),
                      ),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      // RichText(
                      //   text: TextSpan(
                      //     text: "Sign up using one of the following methods",
                      //     style: TextStyle(
                      //       color: Colors.grey[500],
                      //       fontSize: Dimensions.font20,
                      //     ),
                      //   ),
                      // ),
                      // Wrap(
                      //   children: List.generate(
                      //     3,
                      //     (index) => Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: CircleAvatar(
                      //         radius: Dimensions.radius30,
                      //         backgroundImage:
                      //             AssetImage("assets/image/" + signupImages[index]),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                )
              : CustomLoader();
        }));
  }
}
