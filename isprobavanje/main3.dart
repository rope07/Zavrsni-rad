import 'package:flutter/material.dart';

import 'child2.dart';

void main() => runApp(new Parent());

class Parent extends StatefulWidget {
  @override
  _ParentState createState() => _ParentState();
}

class _ParentState extends State<Parent> {

  String data = 'no';
  String dataToParent = 'Greetings from the coming father';

  void onDataChange(val){
    setState(() {
      data = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Child2(dataToParent: dataToParent, callback: (val) => onDataChange(val)),
                Container(
                  child: Text(data),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
