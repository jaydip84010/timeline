import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:timeline/model.dart';
import 'package:timeline/screen/forget_password_screen.dart';
import 'package:timeline/screen/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController mobile = TextEditingController();
  final form = GlobalKey<FormState>();
  late bool visible = false;

  // isvisible(){
  //   setState(() {
  //     visible=true;
  //   });
  // }
  // novisible(){
  //   setState(() {
  //     visible=false;
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 2.8,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Image.asset(
                    'assets/images/image2.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            Positioned(
                top: 60,
                left: 30,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset(
                    'assets/images/left aerrow.png',
                    color: Colors.white,
                    height: 18,
                    width: 20,
                  ),
                )),
            Positioned(
                top: 200,
                left: 10,
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                )),
            Positioned(
              top: 280,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xffff28333f),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(color: Color(0xffffcd01f6), spreadRadius: 2)
                    ]),
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 1.3,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
              ),
            ),
            Positioned(
                bottom: 35,
                left: 20,
                child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 1.6,
                  width: 350,
                  child: Form(
                      key: form,
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
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
                                contentPadding: EdgeInsets.only(
                                    top: 20, left: 10),
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
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            textAlignVertical: TextAlignVertical.center,
                            controller: email,
                            validator: (email) {
                              if (email!.isEmpty ||
                                  !RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(email)) {
                                return "enter Email";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: 20, left: 10),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                    const BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color(0xffffcd01f6))),
                                label: const Text(
                                  ' Email',
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffff6e7784),
                                  ),
                                ),
                                alignLabelWithHint: true,
                                hintText: 'Email',
                                hintStyle: const TextStyle(
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
                            keyboardType: TextInputType.datetime,
                            textAlignVertical: TextAlignVertical.center,
                            controller: mobile,
                            validator: (mobile) {
                              if (mobile!.isEmpty ||
                                  mobile.length < 10 ||
                                  mobile.length > 10) {
                                return "enter mobile number";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: 20, left: 10),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                    BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: const Color(0xffffcd01f6))),
                                label: const Text(
                                  ' Mobile Number',
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffff6e7784),
                                  ),
                                ),
                                alignLabelWithHint: true,
                                hintText: 'Mobile Numer',
                                hintStyle: TextStyle(
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
                          const SizedBox(
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
                                contentPadding: EdgeInsets.only(
                                    top: 20, left: 10),
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
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.datetime,
                            textAlignVertical: TextAlignVertical.center,
                            controller: dob,
                            validator: (date) {
                              if (date!.isEmpty ||
                                  date.length < 10 ||
                                  date.length > 10) {
                                return "enter Date of Birth";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: 20, left: 10),
                                suffixIcon: Container(
                                    child: const Icon(
                                      Icons.calendar_month,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                    BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: const Color(0xffffcd01f6))),
                                label: const Text(
                                  ' Date of Birth',
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffff6e7784),
                                  ),
                                ),
                                alignLabelWithHint: true,
                                hintText: 'Date of Birth',
                                hintStyle: TextStyle(
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
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              getdata();
                              // await Navigator.of(context).push(
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const SignInScreen()));
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
                          )
                        ],
                      )),
                )),
            Positioned(
                bottom: 25,
                left: 70,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignInScreen()));
                  },
                  child: RichText(
                      text: const TextSpan(
                          children: [
                            TextSpan(
                                text: 'You have an account ?',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15)),
                            TextSpan(
                                text: ' Sign In',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15))
                          ],
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15))),
                ))
          ],
        ));
  }

  Future getdata() async {
    Map<String, String> map = {
      'name': name.text,
      'email': email.text,
      'password': password.text,
      'dob': dob.text,
      'mobile': mobile.text
    };
    final response = await http.post(
        Uri.parse(
          'https://djohnsoft.xyz/timeline/public/api/signUp',
        ),
        body: map);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "SignUp Successfully",
          textColor: Colors.white,
          backgroundColor: Colors.green,
          gravity: ToastGravity.BOTTOM);
      await Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SignInScreen()));
    } else {
      Fluttertoast.showToast(
          msg: "Already Exist",
          textColor: Colors.white,
          backgroundColor: Colors.red,
          gravity: ToastGravity.BOTTOM);
    }
  }
}

pagech() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, child) => SignInScreen(),
      barrierDismissible: true,
      transitionsBuilder: (context, animation, secondanimation, child) {
        var tween = Tween(begin: Offset(1.0, 0.0), end: Offset.zero)
            .chain(CurveTween(curve: accelerateEasing));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      });
}
