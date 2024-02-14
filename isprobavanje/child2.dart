import 'package:flutter/material.dart';

class Child2 extends StatefulWidget {
  Child2({Key key, this.dataToParent, this.callback});
  final callback;
  String dataToParent;

  @override
  _Child2State createState() => _Child2State();
}

class _Child2State extends State<Child2> {

  String inputText;
  String data = 'Greetings from the Father Component';
  void firedA(){
    print('A click was triggered in the subcomponent');
    widget.callback('$inputText');
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(top: 3),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 300,
            alignment: Alignment.center,
            //margin: EdgeInsets.only(top: 3.0),
            decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10.0)
            ),
            child: Text(widget.dataToParent),
          ),
          RaisedButton(
            onPressed: firedA,
            child: Text('to parent component'),
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Pass value to parent component',
              contentPadding: const EdgeInsets.all(10.0)
            ),
            onChanged: (val){
              setState(() {
                inputText = val;
              });
              print(inputText);
            },
          )
        ],
      ),
    );
  }
}
