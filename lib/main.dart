import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeline/screen/homemainscreen.dart';
import 'package:timeline/screen/sign_in_screen.dart';
import 'package:timeline/screen/sign_up_screen.dart';
import 'package:timeline/screen/upload_screen.dart';

void main() => runApp(const MaterialApp(
      home:UploadScreen(),
      debugShowCheckedModeBanner: false,
    ));

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  isloggedin() async {
    Future<SharedPreferences>? pref = SharedPreferences.getInstance();
    var data = await pref.then((value) => value.getString('name'));
    if (data != null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeMainScreen()));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SignInScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedContainer(
          height: 320,
          width: 380,
          duration: Duration(seconds: 4),
          curve: Curves.easeInOut,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      isloggedin();
    });
  }

  pagech() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, child) => SignUpScreen(),
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
