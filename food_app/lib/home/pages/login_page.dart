import 'package:aprilskuisine/components/const.dart';
import 'package:aprilskuisine/components/or_divider.dart';
import 'package:aprilskuisine/components/rounded_button.dart';
import 'package:aprilskuisine/components/rounded_social.dart';
import 'package:aprilskuisine/home/pages/my_home_page.dart';
import 'package:aprilskuisine/home/pages/signup.dart';
import 'package:aprilskuisine/home/pages/welcomePage.dart';
import 'package:aprilskuisine/resourese/auth_methods.dart';
import 'package:aprilskuisine/utils/dimensions.dart';
import 'package:aprilskuisine/widgets/ScaleRoute.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isSigningIn = false;
  bool isRequest = false;
  final bool isLoginRequest = false;
  bool isNoVisiblePassword = true;

  late String email;
  late String password;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            // constraints: const BoxConstraints.expand(),
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage("assets/image/madam.png"),
            //     fit: BoxFit.cover,
            //     opacity: 200,
            //   ),
            // ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: Dimensions.screenHeight * 0.05),
                  Center(
                    child: Container(
                        child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 100,
                            backgroundImage:
                                AssetImage("assets/image/food.png"))),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: const Text(
                            "Welcome  ",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(2),
                          child: const Text(
                            "Kuisine",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: size.width * 0.7,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.8,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(
                            errorText: 'This Field is required',
                          ),
                          EmailValidator(errorText: 'Invalid phone number')
                        ]),
                        autofocus: false,
                        enabled: true,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(),
                          ),
                          fillColor: Colors.green[100],
                          filled: false,
                          hintText: "Email",
                          hintStyle: const TextStyle(
                              color: Colors.black, fontSize: 13),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              "assets/image/images/icon_user.png",
                              width: 3,
                              height: 3,
                              // color: Colors.green,
                            ),
                          ),
                          // suffixIcon: const Icon(Icons.person),
                          labelText: 'Email or Phone Number',
                          labelStyle: const TextStyle(
                              color: Colors.black, fontSize: 13),
                        ),
                        obscureText: false,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: size.width * 0.8,
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: "This Field Is Required"),
                          EmailValidator(errorText: "Invalid Email Address"),
                          MinLengthValidator(6,
                              errorText: "Minimum 6 Characters Required"),
                        ]),
                        onChanged: (val) {
                          email = val;
                        },
                        autofocus: false,
                        enabled: true,
                        showCursor: true,
                        enableInteractiveSelection: true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.green),
                          ),
                          fillColor: Colors.green[100],
                          filled: false,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isNoVisiblePassword) {
                                  isNoVisiblePassword = false;
                                } else {
                                  isNoVisiblePassword = true;
                                }
                              });
                            },
                            child: (isNoVisiblePassword)
                                ? Padding(
                                    padding: const EdgeInsets.all(9.0),
                                    child: Image.asset(
                                      "assets/image/images/icon_eye_close.png",
                                      width: 15,
                                      height: 15,
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Image.asset(
                                      "assets/image/images/icon_eye_open.png",
                                      // color: Colors.green,
                                      width: 15,
                                      height: 15,
                                    ),
                                  ),
                          ),
                          hintText: '**********',
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                              color: Colors.black, fontSize: 13),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(
                              "assets/image/images/icon_password.png",
                              // color: Colors.green,
                              width: 10,
                              height: 10,
                            ),
                          ),
                        ),
                        obscureText: isNoVisiblePassword,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => {
                      // Navigator.push(context, ScaleRoute(page: SignUpPage()))
                    },
                    child: SizedBox(
                      width: size.width * 0.7,
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: facebookColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundedButton(
                        color: Colors.green.shade600,
                        text: 'Login',
                        textColor: Colors.white,
                        press: () {
                          Navigator.push(
                              context, ScaleRoute(page: const MyHomePage2()));
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const OrDivider(color: Colors.black),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: RoundedSocial(
                          icon: FontAwesomeIcons.facebook,
                          text: "Facebook",
                          press: () {},
                          color: facebookColor,
                        ),
                      ),
                      RoundedSocial(
                        color: googleColor,
                        icon: FontAwesomeIcons.google,
                        text: "Google",
                        press: () async {
                          setState(() {
                            _isSigningIn = true;
                          });
                          setState(() {
                            _isSigningIn = false;
                          });

                          User? user = await signInWithGoogle(
                            context: context,
                          );
                          setState(() {
                            _isSigningIn = false;
                          });
                          if (user != null) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => Welcomepage(),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 2,
                  ),
                  SizedBox(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(
                            child: Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => {
                              Navigator.push(
                                  context, ScaleRoute(page: const SignUp()))
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                color: facebookColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
