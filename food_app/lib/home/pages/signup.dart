import 'package:aprilskuisine/components/const.dart';
import 'package:aprilskuisine/components/or_divider.dart';
import 'package:aprilskuisine/components/rounded_button.dart';
import 'package:aprilskuisine/home/pages/login_page.dart';
import 'package:aprilskuisine/widgets/ScaleRoute.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isSigningIn = false;
  bool isRequest = false;
  final bool isLoginRequest = false;
  bool isNoVisiblePassword = true;

  late String email;
  late String password;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var SignUpImages = ["t.png", "f.png", "g,png"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green[700],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(2),
                          child: const Text(
                            "April's Kuisine",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(2),
                          child: const Text("Enter your details",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              )),
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
                        style: (const TextStyle(color: Colors.white)),
                        autofocus: false,
                        enabled: true,
                        enableInteractiveSelection: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          fillColor: Colors.green[50],
                          filled: false,
                          hintText: ' First Name',
                          labelText: 'First Name',
                          labelStyle: const TextStyle(
                              color: Colors.white, fontSize: 13),
                          hintStyle: const TextStyle(
                              color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: size.width * 0.8,
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: TextFormField(
                        style: (const TextStyle(color: Colors.white)),
                        autofocus: true,
                        enabled: true,
                        showCursor: true,
                        enableInteractiveSelection: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(),
                          ),
                          contentPadding: const EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          fillColor: Colors.green[50],
                          filled: false,
                          hintText: ' Last Name',
                          labelText: 'Last Name',
                          labelStyle: const TextStyle(
                              color: Colors.white, fontSize: 13),
                          hintStyle: const TextStyle(
                              color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: size.width * 0.8,
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: TextFormField(
                        style: (const TextStyle(color: Colors.white)),
                        autofocus: true,
                        enabled: true,
                        showCursor: true,
                        enableInteractiveSelection: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(),
                          ),
                          contentPadding: const EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          fillColor: Colors.green[50],
                          filled: false,
                          hintText: ' Email',
                          labelText: 'Email Address',
                          labelStyle: const TextStyle(
                              color: Colors.white, fontSize: 13),
                          hintStyle: const TextStyle(
                              color: Colors.white, fontSize: 13),
                        ),
                      ),
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
                        style: (const TextStyle(color: Colors.white)),
                        autofocus: false,
                        enabled: true,
                        enableInteractiveSelection: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          contentPadding: const EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          fillColor: Colors.green[50],
                          filled: false,
                          hintText: ' Phone Number',
                          labelText: 'Phone Number',
                          labelStyle: const TextStyle(
                              color: Colors.white, fontSize: 13),
                          hintStyle: const TextStyle(
                              color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundedButton(
                        color: Colors.white,
                        text: 'Proceed',
                        textColor: Colors.green,
                        press: () async {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    child: InkWell(
                      onTap: () => {
                        Navigator.push(context, ScaleRoute(page: const Login()))
                      },
                      child: const Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
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
    // void  _refgistration(){
    //   string name
    // }
  }
}
