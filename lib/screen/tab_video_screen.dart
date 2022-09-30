import 'package:flutter/material.dart';

class TabVideoScreen extends StatefulWidget {
  const TabVideoScreen({Key? key}) : super(key: key);

  @override
  State<TabVideoScreen> createState() => _TabVideoScreenState();
}

class _TabVideoScreenState extends State<TabVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffff28333f),
      body: SafeArea(
          child: Container(
            height: 500,width: 380,
            child: ListView.builder(
                scrollDirection: Axis.vertical,padding: EdgeInsets.all(10),
                itemCount: 20,
                itemBuilder: (Context, index) {
                  return Column(
                    children: [
                      Container(
                        child: ListTile(tileColor: Colors.grey,style:ListTileStyle.list ,
                          leading: Image.asset(
                            'assets/images/person.jpeg',
                            fit: BoxFit.fill,
                          ),
                          title: Center(child: Text("flutter")),
                          subtitle: Center(child: Text('Google')),
                          trailing: Icon(Icons.star),
                        ),
                      ),
                      SizedBox(height: 10,)
                    ],
                  );
                }),
          )),
    );
  }
}
