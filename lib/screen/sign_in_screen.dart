import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timeline/screen/forget_password_screen.dart';
import 'package:timeline/screen/homeScreen.dart';
import 'package:timeline/screen/homemainscreen.dart';
import 'package:timeline/screen/sign_up_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var data;
  Future<SharedPreferences>? pref = SharedPreferences.getInstance();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  var form = GlobalKey<FormState>();
  late bool visible = false;

  savepref() async {
    await pref?.then((value) => value.setString('name', name.text));
  }

  getpref() async {
    data = await pref?.then((value) => value.getString('name'));
    print(data);
  }

  deletepref() async {
    data = await pref?.then((value) => value.remove('email'));
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Column(
              children: [
                Opacity(
                  opacity: 0.7,
                  child: Image.asset(
                    'assets/images/image.png',
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height / 1.9,
                    width: 400,
                  ),
                )
              ],
            ),
            Positioned(
                left: 130,
                top: 110,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.fill,
                  height: 120,
                  width: 120,
                )),
            Positioned(
                top: 240,
                left: 130,
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    'TimeLine',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                )),
            Positioned(
                top: 340,
                left: 10,
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                )),
            Positioned(
              top: 410,
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffff28333f),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(color: Color(0xffffcd01f6), spreadRadius: 2)
                      ]),
                  height: MediaQuery.of(context).size.height / 1.3,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            Positioned(
                top: 450,
                left: 20,
                child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: 350,
                  child: SingleChildScrollView(
                    child: Form(
                        key: form,
                        autovalidateMode: AutovalidateMode.always,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.name,
                              textAlignVertical: TextAlignVertical.center,
                              validator: (name) {
                                if (name!.isEmpty) {
                                  return "enter name";
                                } else {
                                  return null;
                                }
                              },
                              controller: name,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 20,left: 10),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                      const BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: const Color(0xffffcd01f6))),
                                  label: const Text(
                                    ' Name',
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffff6e7784),
                                    ),
                                  ),
                                  alignLabelWithHint: true,
                                  hintText: 'Name',
                                  hintStyle: const TextStyle(
                                    debugLabel: 'sks',
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffff6e7784),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: visible ? false : true,
                              textAlignVertical: TextAlignVertical.center,
                              controller: password,
                              validator: (password) {
                                if (password!.isEmpty || password.length < 8) {
                                  return "enter password";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 20,left: 10),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      visible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        visible = !visible;
                                      });
                                    },
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                      BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                      BorderSide(color: Color(0xffffcd01f6))),
                                  label: const Text(
                                    ' Password',
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffff6e7784),
                                    ),
                                  ),
                                  alignLabelWithHint: true,
                                  hintText: 'Password',
                                  hintStyle: const TextStyle(
                                    debugLabel: 'sks',
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffff6e7784),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Colors.white),
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        )),
                  ),
                )),
            Positioned(
                left: 200,
                bottom: 230,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ForgetPasswordScreen(),
                    ));
                  },
                  child: Container(
                    child: Text(
                      'Forgot your password?',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Montserrat',
                          color: Colors.deepPurpleAccent),
                    ),
                  ),
                )),
            Positioned(
                bottom: 140,
                left: 20,
                child: InkWell(
                  onTap: () {
                    getdata();
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => HomeMainScreen()));
                  },
                  child: Container(
                    height: 45,
                    width: 350,
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [
                            Colors.pinkAccent,
                            Colors.deepPurpleAccent
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                    ),
                  ),
                )),
            Positioned(
                bottom: 20,
                left: 100,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignUpScreen()));
                  },
                  child: RichText(
                      text: TextSpan(
                          text: "Don't have account ?",
                          children: [
                            TextSpan(
                                text: ' Sign Up',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15))
                          ],
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15))),
                ))
          ],
        ));
  }

  Future getdata() async {
    Map<String, String> map = {
      'name': name.text,
      'password': password.text,
    };
    final response = await http.post(
        Uri.parse('https://djohnsoft.xyz/timeline/public/api/login'),
        body: map);
    if (response.statusCode == 200) {
      await savepref();
      await getpref();
      await waitcall();
      Fluttertoast.showToast(
          msg: "Login Success",
          backgroundColor: Colors.green,
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM);
    } else {
      Fluttertoast.showToast(
          msg: "User not found",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM);
    }
  }

  waitcall() {
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).push(pagech());
    });
  }
}

pagech() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, child) => HomeMainScreen(),
      transitionsBuilder: (context, animation, secondanimation, child) {
        var tween = Tween(begin: Offset(1.0, 0.0), end: Offset.zero)
            .chain(CurveTween(curve: accelerateEasing));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      });
}
