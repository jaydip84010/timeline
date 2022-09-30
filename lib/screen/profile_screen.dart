import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeline/screen/tab_image_screen.dart';
import 'package:timeline/screen/tab_video_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  PageController controller = PageController();
  File? photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffff28333f),
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.chevron_left,
                        size: 30,
                        color: Colors.white,
                      )),
                  Container(
                    width: 190,
                    child: Text(
                      'My Profile',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      logout();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      margin: EdgeInsets.only(top: 5),
                      child: Center(
                          child: Image.asset(
                        'assets/images/power-on.png',
                        height: 17,
                        width: 17,
                        fit: BoxFit.fill,
                      )),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xfffff2f2f2)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Stack(children: [
                  Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.pink, Colors.deepPurpleAccent],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight)),
                  ),
                  Positioned(
                    top: 3,
                    left: 2,
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/images/person.jpeg',
                        height: 105,
                        width: 105,
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                  Positioned(
                      left: 40,
                      top: 92,
                      child: InkWell(
                        onTap: () {
                          setimage();
                        },
                        child: Container(
                          height: 18,
                          width: 18,
                          child: CircleAvatar(
                              backgroundColor: Color(0xfffff2f2f2),
                              radius: 20,
                              child: Icon(
                                Icons.edit,
                                size: 15,
                              )),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ))
                ]),
              ),
              SizedBox(
                height: 10,
              ),
              Text("John Larson",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
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
                height: 15,
              ),
              Container(
                height: 50,
                width: 357,
                decoration: BoxDecoration(
                    color: Color(0xfff7f7f7),
                    borderRadius: BorderRadius.circular(10)),
                child: TabBar(
                  controller: tabController,
                  labelColor: Colors.white,
                  unselectedLabelStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                  tabs: [
                    Tab(
                      text: 'Videos',
                    ),
                    Tab(
                      text: 'Images',
                    ),
                  ],
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          colors: [Colors.pink, Colors.deepPurple],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                  height: MediaQuery.of(context).size.height / 1.74,
                  width: 373,
                  child: TabBarView(
                    controller: tabController,
                    children: [TabVideoScreen(), TabImageScreen()],
                  ))
            ],
          ),
        ],
      )),
    );
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
//
  }

  Future logout() async {
    Future<SharedPreferences> pref = SharedPreferences.getInstance();
    pref.then((value) => value.remove('name'));
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
