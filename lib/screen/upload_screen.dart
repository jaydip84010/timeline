import 'dart:async';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  VideoPlayerController? controller;
  bool loop = true;
  File? media;
  bool isvisible = true;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize();
    controller!.setLooping(false);
    controller!.setVolume(80);
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                    height: 15,
                    width: 10,
                    margin: EdgeInsets.only(left: 20),
                    child: Image.asset(
                      'assets/images/left aerrow.png',
                      fit: BoxFit.fill,
                      color: Colors.black,
                    )),
                SizedBox(
                  width: 30,
                ),
                Text(
                  'Upload Video and Photo ',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Center(
                child: InkWell(
              onTap: () {
                uploadmedia();
                Timer(Duration(seconds: 3), () {
                  Navigator.pop(context);
                });
              },
              child: Container(
                height: 250,
                width: 350,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: DottedBorder(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/attachment.png',
                          color: Colors.deepPurple,
                          height: 20,
                          width: 20,
                        ),
                        Text(
                          ' Upload Video or Image',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.deepPurple),
                        )
                      ],
                    ),
                  ),
                  color: Colors.deepPurple,
                  strokeWidth: 0.6,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(20),
                ),
              ),
            )),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(left: 20),
                height: 40,
                width: 350,
                child: Center(
                  child: Text(
                    'Upload',
                    style: TextStyle(
                        fontSize: 16,
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
            ),
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Center(
                  child: controller != null
                      ? InkWell(
                          onTap: () {},
                          child: AspectRatio(
                            aspectRatio: controller!.value.aspectRatio,
                            child: VideoPlayer(controller!),
                          ),
                        )
                      : Container(
                          height: 100,
                          width: 100,
                          color: Colors.green,
                        ),
                ),
                Positioned(
                    top: 90,
                    left: 180,
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            controller!.value.isPlaying
                                ? controller!.pause()
                                : controller!.play();
                          });
                        },
                        child: Visibility(
                          visible: isvisible,
                          child: Icon(
                            controller!.value.isPlaying
                                ? Icons.pause
                                : Icons.play_circle_outlined,
                            color: Colors.red,
                            size: 50,
                          ),
                        ))),
                Positioned(
                    bottom: 0,
                    child: Container(
                        width: 390,
                        child: VideoProgressIndicator(
                          controller!,
                          allowScrubbing: true,
                          colors: VideoProgressColors(
                              playedColor: Colors.red,
                              backgroundColor: Colors.grey),
                        ))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  uploadmedia() async {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Choose Image'),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    gallary();
                  },
                  child: Center(child: Text('Image'))),
              ElevatedButton(
                  onPressed: () {
                    gallaryvideo();
                  },
                  child: Center(child: Text('Video')))
            ],
          );
        });
  }

  // camera() async {
  //   final picked = await ImagePicker().pickImage(source: ImageSource.camera);
  //   setState(() {
  //     photo = File(picked!.path);
  //   });
  // }

  gallary() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      media = File(picked!.path);
    });
  }

  gallaryvideo() async {
    final pickedvideo =
        await ImagePicker().pickVideo(source: ImageSource.gallery);
    setState(() {
      media = File(pickedvideo!.path);
    });
  }
}
