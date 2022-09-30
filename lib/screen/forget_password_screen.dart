import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeline/chg_password.dart';
import 'package:timeline/screen/homemainscreen.dart';
import 'package:timeline/screen/sign_in_screen.dart';
import 'package:http/http.dart' as http;

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController email = TextEditingController();

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
                    'assets/images/image2.png',
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height / 1.9,
                    width: 400,
                  ),
                )
              ],
            ),
            Positioned(
                top: 360,
                left: 10,
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Forget password',
                    style: TextStyle(
                        fontSize: 2,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                )),
            Positioned(
              top: 430,
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffff28333f),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(color: Color(0xffffcd01f6), spreadRadius: 2)
                      ]),
                  height: MediaQuery.of(context).size.height / 1.3,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            Positioned(
                bottom: 360,
                left: 10,
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    maxLines: 2,
                    " Please enter the email address you'd  like your \n "
                    "password reset information sent to",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                )),
            Positioned(
                top: 520,
                left: 20,
                child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: 350,
                  child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            controller: email,
                            validator: (email) {
                              if (email!.isEmpty) {
                                return "enter email";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: const Color(0xffffcd01f6))),
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
                                hintStyle: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffff6e7784),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ],
                      )),
                )),
            Positioned(
                bottom: 140,
                left: 20,
                child: InkWell(
                  onTap: () {
                    isname();
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const HomeMainScreen()));
                  },
                  child: Container(
                    height: 50,
                    width: 350,
                    child: const Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                          colors: [Colors.pinkAccent, Colors.deepPurpleAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                    ),
                  ),
                )),
            Positioned(
                bottom: 40,
                left: 100,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignInScreen()));
                  },
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignInScreen()));
                    },
                    child: RichText(
                        text: const TextSpan(
                            text: "Don't have account ?",
                            children: [
                              const TextSpan(
                                  text: ' Sign in',
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
                  ),
                ))
          ],
        ));
  }

  Future isname() async {
    Future<SharedPreferences>? pref = SharedPreferences.getInstance();
    var data = await pref.then((value) => value.getString('name'));
    if (data != null) {
      Navigator.of(context).push(pagech());
    } else {
      Fluttertoast.showToast(
          msg: 'email not found',
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red);
    }
  }
}

pagech() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, child) => ChgPassword(),
      transitionsBuilder: (context, animation, secondanimation, child) {
        var tween = Tween(begin: Offset(1.0, 0.0), end: Offset.zero)
            .chain(CurveTween(curve: accelerateEasing));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      });
}
