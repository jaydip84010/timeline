import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeline/screen/profile_screen.dart';
import 'package:timeline/screen/sign_in_screen.dart';
import 'package:timeline/screen/upload_screen.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({Key? key}) : super(key: key);

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => UploadScreen()));
          },
          child: Center(
              child: Icon(
            Icons.add,
            color: Colors.white,
          )),
          backgroundColor: Colors.deepPurpleAccent),
      drawer: Container(
          width: 250,
          child: Drawer(
            backgroundColor: Color(0xffff28333f),
            child: SafeArea(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
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
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.purpleAccent),
                          ),
                          Positioned(
                              left: 3,
                              top: 3,
                              child: ClipRRect(
                                child: Image.asset(
                                  'assets/images/person.jpeg',
                                  height: 113,
                                  width: 113,
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(80),
                              ))
                        ],
                      ),
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
                      height: 5,
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
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xfffffafafa),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.home_filled,
                                      size: 22,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Home',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xfffffafafa),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProfileScreen()));
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.person,
                                      size: 22,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Profile',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xfffffafafa),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.settings,
                                      size: 22,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Setting',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 250,
                    ),
                    Container(
                      height: 40,
                      width: 170,
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
                    )
                  ],
                ),
              ),
            ),
          )),
      appBar: PreferredSize(
        preferredSize: Size(300, 60),
        child: AppBar(
            actions: [
              Container(
                  width: 50,
                  margin: EdgeInsets.only(right: 25, top: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/images/person.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ))
            ],
            backgroundColor: Color(0xffff28333f),
            title: Text(
              ' TimeLine',
              style: TextStyle(
                  fontSize: 20, color: Colors.white, fontFamily: 'Montserrat'),
            )),
      ),
      backgroundColor: Color(0xffff28333f),
      body: SafeArea(child: LayoutBuilder(builder: (context, costraint) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.10,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      borderRadius: BorderRadius.circular(60),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 5, top: 5),
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
                                      borderRadius: BorderRadius.circular(30)),
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
        );
      })),
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
}
