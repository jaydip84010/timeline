import 'package:flutter/material.dart';

class TabImageScreen extends StatefulWidget {
  const TabImageScreen({Key? key}) : super(key: key);

  @override
  State<TabImageScreen> createState() => _TabImageScreenState();
}

class _TabImageScreenState extends State<TabImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffff28333f),
        body: SafeArea(
            child: Container(
              margin: EdgeInsets.only(left: 3),
              height: 500,width: 365,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 170

                  ),
                  itemBuilder: (context, index) {
                    return Card(borderOnForeground: true,elevation:10,
                      child: Image.asset(
                        'assets/images/person.jpeg',

                      ),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3),side: BorderSide(color: Colors.grey,width: 0.5,style: BorderStyle.solid)),
                    );
                  }),
            )));
  }
}
