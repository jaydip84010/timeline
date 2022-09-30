import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timeline/screen/sign_in_screen.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class ChgPassword extends StatefulWidget {
  const ChgPassword({Key? key}) : super(key: key);

  @override
  State<ChgPassword> createState() => _ChgPasswordState();
}

class _ChgPasswordState extends State<ChgPassword> {
  TextEditingController oldpassword = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  var form = GlobalKey<FormState>();

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
                top: 320,
                left: 10,
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    'Change Password',
                    style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                )),
            Positioned(
              top: 390,
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
                              keyboardType: TextInputType.emailAddress,
                              textAlignVertical: TextAlignVertical.center,
                              controller: oldpassword,
                              validator: (oldpass) {
                                if (oldpass!.isEmpty) {
                                  return "Enter old-password";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Color(0xffffcd01f6))),
                                  contentPadding:
                                      const EdgeInsets.only(left: 20, top: 20),
                                  label: const Text(
                                    ' Old Password',
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffff6e7784),
                                    ),
                                  ),
                                  alignLabelWithHint: true,
                                  hintText: 'OldPassword',
                                  hintStyle: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffff6e7784),
                                      height: 2.5),
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
                              textAlignVertical: TextAlignVertical.center,
                              controller: newpassword,
                              validator: (newpassword) {
                                if (newpassword!.isEmpty ||
                                    newpassword.length < 8) {
                                  return "Enter new password";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xffffcd01f6))),
                                  contentPadding:
                                      EdgeInsets.only(left: 20, top: 20),
                                  label: const Text(
                                    ' NewPassword',
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffff6e7784),
                                    ),
                                  ),
                                  alignLabelWithHint: true,
                                  hintText: 'NewPassword',
                                  hintStyle: const TextStyle(
                                      debugLabel: 'sks',
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffff6e7784),
                                      height: 2.5),
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
                bottom: 200,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(pagech());
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
                bottom: 110,
                left: 20,
                child: InkWell(
                  onTap: () {
                    changepass();
                  },
                  child: Container(
                    height: 60,
                    width: 350,
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [Colors.pinkAccent, Colors.deepPurpleAccent],
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
                    Navigator.of(context).push(pagech());
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

  Future changepass() async {
    Map<String, String> map = {
      'userID': '80',
      'accessToken': 'MP5asBKHd69h7ngABKsNKq8W7kb5rf',
      'oldPassword': oldpassword.text,
      'newPassword': newpassword.text,
    };
    final response = await http.post(
        Uri.parse('https://djohnsoft.xyz/timeline/public/api/changePassword'),
        body: map);

    if (response.statusCode == 200) {
      print(response.body);
      Fluttertoast.showToast(
          msg: "Password Changed",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM);
      await Navigator.of(context).push(pagech());
    } else {
      Fluttertoast.showToast(
          msg: "password not changed",
          backgroundColor: Colors.green,
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM);
    }
  }

  pagech() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, child) => SignInScreen(),
        transitionsBuilder: (context, animation, secondanimation, child) {
          var tween = Tween(begin: Offset(1.0, 0.0), end: Offset.zero)
              .chain(CurveTween(curve: accelerateEasing));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        });
  }
}
