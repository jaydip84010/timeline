import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeline/screen/homemainscreen.dart';

// import 'package:http/http.dart' as http;
import 'package:timeline/screen/profile_screen.dart';
import 'package:timeline/screen/sign_in_screen.dart';

import '../model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? photo;

  @override
  Widget build(BuildContext context) {
    var scaffoldkey = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: Color(0xffff28333f),
      body: SafeArea(
          key: scaffoldkey,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 40),
                            child: Text(
                              'Hello!',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              '  Good Morning',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Montserrat',
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 140,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                        },
                        child: ClipRRect(
                          child: photo != null
                              ? Image.file(
                                  photo!,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.fill,
                                )
                              : Container(
                                  child: Center(child: Icon(Icons.person)),
                                ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 1.19,
                    width: MediaQuery.of(context).size.width / 0.9,
                    child: ListView.builder(itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 240,
                            width: 370,
                            decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                border: Border.all(color: Color(0xffeeeeee))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 0,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfileScreen()));
                                      },
                                      child: CircleAvatar(
                                        child: ClipRRect(
                                          child: Container(
                                            child: Image.asset(
                                              'assets/images/person.jpeg',
                                              height: 40,
                                              width: 40,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(60),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          margin:
                                              EdgeInsets.only(left: 5, top: 5),
                                          child: Text(
                                            'John Larson',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat'),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Text(
                                            'Flutter devloper',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: 'Montserrat'),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 100,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      height: 30,
                                      width: 30,
                                      child: Center(
                                          child: Image.asset(
                                        'assets/images/more.png',
                                        height: 20,
                                        width: 20,
                                      )),
                                      decoration: BoxDecoration(
                                          color: Color(0xfffff3f3f3),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 170,
                                  width: 350,
                                  child: ClipRRect(
                                      child: Image.asset(
                                          'assets/images/pexels-eberhard-grossgasteiger-572897.jpg',
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(15)),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      );
                    }),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 1.8,
                color: Color(0xffff28333f),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomeMainScreen()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              (Icons.close_rounded),
                              size: 20,
                              color: Colors.white,
                            ),
                            Text(
                              "  Close ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  fontFamily: 'Montserrat'
                                      ''),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Stack(children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.purpleAccent, width: 4),
                            shape: BoxShape.circle,
                          ),
                          // gradient: LinearGradient(
                          //     colors: [
                          //       Colors.pink,
                          //       Colors.deepPurpleAccent
                          //     ],
                          //     begin: Alignment.centerLeft,
                          //     end: Alignment.centerRight)),
                          child: InkWell(
                              onTap: () {
                                setphoto();
                                Timer(Duration(seconds: 3), () {
                                  Navigator.of(context).pop();
                                });
                              },
                              child: photo != null
                                  ? Container(
                                      child: ClipRRect(
                                        child: Image.file(
                                          photo!,
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius: BorderRadius.circular(80),
                                      ),
                                    )
                                  : Container(
                                      child: CircleAvatar(
                                          radius: 55,
                                          child: ClipRRect(
                                            child: Center(
                                                child: Icon(
                                              Icons.person,
                                              size: 20,
                                            )),
                                            borderRadius:
                                                BorderRadius.circular(70),
                                          )),
                                    )),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("John Larson",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            fontFamily: 'Montserrat')),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Johnlarson43@gmail.com',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: 'Montserrat')),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xfffffafafa),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.home_filled),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Home',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20),
                                  )
                                ]),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xfffffafafa),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProfileScreen()));
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.person),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Profile',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20),
                                  )
                                ]),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xfffffafafa),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.settings),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Settings',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                )
                              ]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              Positioned(
                  left: 45,
                  bottom: 60,
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xfffff1f1f1)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: Icon(Icons.power_settings_new_outlined)),
                          SizedBox(
                            width: 4,
                          ),
                          InkWell(
                            onTap: () {
                              logout();
                            },
                            child: Text(
                              ' Logout',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          )
                        ]),
                  ))
            ],
          )),
    );
  }

  Future logout() async {
    // final response = await http.post(
    //     Uri.parse('https://djohnsoft.xyz/timeline/public/api/login'),
    //    );
    Future<SharedPreferences>? pref = SharedPreferences.getInstance();
    await pref.then((value) => value.remove('name'));
    Fluttertoast.showToast(
        msg: "SignOut Success",
        backgroundColor: Colors.red,
        textColor: Colors.white);
    Navigator.of(context).push(pagech());
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

  setimage() async {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Choose Image'),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    camera();
                  },
                  child: Center(child: Text('Camera'))),
              ElevatedButton(
                  onPressed: () {
                    gallary();
                  },
                  child: Center(child: Text('Gallery')))
            ],
          );
        });
  }

  setphoto() async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text('Choose Image')),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    camera();
                  },
                  child: Center(child: Text('Camera'))),
              ElevatedButton(
                  onPressed: () {
                    gallary();
                  },
                  child: Center(child: Text('Gallery')))
            ],
          );
        });
  }

  camera() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      photo = File(picked!.path);
    });
  }

  gallary() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      photo = File(picked!.path);
    });
  }
}
