// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  static const String id = "login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedValue = false;

  final _formKey = GlobalKey<FormState>();

  void moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changedValue = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await context.vxNav.push(Uri.parse(HomePage.id));

      setState(() {
        changedValue = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                Image.asset(
                  'images/login.png',
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Welcome $name',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 35.0, horizontal: 30.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'UserName',
                          labelStyle: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent,
                          ),
                          hintText: 'Enter your name',
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            name = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Username can't be empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent,
                          ),
                          hintText: 'Enter your Password',
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Password can't be empty";
                          } else if (value.length < 6) {
                            return "Password length should be at least 6 digit";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Material(
                        // shadowColor: Colors.red,
                        color: Colors.deepPurpleAccent,
                        borderRadius:
                            BorderRadius.circular(changedValue ? 50 : 15.0),
                        child: InkWell(
                          // splashColor: Colors.red,
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: 50.0,
                            width: changedValue ? 50 : 130.0,
                            alignment: Alignment.center,
                            child: changedValue
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, HomePage.id);
                      //   },
                      //   child: Text(
                      //     'Login',
                      //     style: TextStyle(
                      //       fontSize: 20.0,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      //   style: TextButton.styleFrom(
                      //     minimumSize: Size(145.0, 50.0),
                      //     backgroundColor: Colors.deepPurpleAccent,
                      //   ),
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ButtonStyle(
// backgroundColor:
// MaterialStateProperty.all(Colors.deepPurpleAccent),
// minimumSize: MaterialStateProperty.all(Size(100.0, 40.0)),
// )
