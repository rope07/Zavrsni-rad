import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio/skup_lokacija/tekstovi.dart';
import 'package:url_launcher/url_launcher.dart';

class HotelOsijek extends StatefulWidget {

  double textSize;
  double iconSize;
  Color textColor;
  HotelOsijek({Key key, this.textSize, this.iconSize, this.textColor}) : super(key: key);

  @override
    _HotelOsijekState createState() => _HotelOsijekState();
}

class _HotelOsijekState extends State<HotelOsijek> {

  Tekstovi tekst = Tekstovi();

  void _calling() async {
    const url = 'tel:+385031230333';
    if(await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _sendMail() async {
    const url = 'mailto:info@hotelosijek.com';
    if(await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _openUrl1() async {
    const url = 'https://croatia.hr/hr-HR/dozivljaji/poslovni-turizam/Hotel-Osijek';
    if(await canLaunch(url)){
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _openUrl2() async {
    const url = 'http://www.hotelosijek.hr';
    if(await canLaunch(url)){
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void incFontSize() async {
    setState(() {
      widget.textSize += 3;
    });
  }

  void decFontSize() async {
    setState(() {
      widget.textSize -= 3;
    });
  }

  void incIconSize() async {
    setState(() {
      widget.iconSize += 3;
    });
  }

  void decIconSize() async {
    setState(() {
      widget.iconSize -= 3;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        bottom: PreferredSize(
          child: Container(
            color: widget.textColor,
            height: 2.0,
          ),
          preferredSize: Size.fromHeight(2.0),
        ),
        title: Text(
          'Hotel Osijek',
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              incFontSize();
              incIconSize();
            },
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              decFontSize();
              decIconSize();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/hotel_osijek.jpg'),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 5, 0),
              child: Column(
                children: [
                  Text(
                    tekst.hotel_osijek,
                    style: TextStyle(fontSize: widget.textSize, color: widget.textColor),
                  ),
                  SizedBox(height: 20),
                  Wrap(
                    children: [
                      Text('izvor: ', style: TextStyle(fontSize: widget.textSize, color: widget.textColor)),
                      RichText(
                        text: TextSpan(
                            text: 'https://croatia.hr/hr-HR/dozivljaji/poslovni-turizam/Hotel-Osijek',
                            style: TextStyle(color: Colors.blue[900], fontSize: widget.textSize),
                            recognizer: TapGestureRecognizer()
                              ..onTap = (){
                                _openUrl1();
                              }
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      Icon(Icons.edit_location, size: widget.iconSize),
                      SizedBox(width: 15),
                      Text(
                        'Šamaćka 4, Osijek',
                        style: TextStyle(fontSize: widget.textSize, color: widget.textColor),
                      ),
                    ],
                  ),
                  Wrap(
                    children: [
                      Icon(Icons.phone, size: widget.iconSize),
                      SizedBox(width: 15),
                      RichText(
                        text: TextSpan(
                            text: '+385 (0)31 230 333',
                            style: TextStyle(color: Colors.blue[900], fontSize: widget.textSize),
                            recognizer: TapGestureRecognizer()
                              ..onTap = (){
                                _calling();
                              }
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    children: [
                      Icon(Icons.email, size: widget.iconSize),
                      SizedBox(width: 15),
                      RichText(
                        text: TextSpan(
                            text: 'info@hotelosijek.com',
                            style: TextStyle(color: Colors.blue[900], fontSize: widget.textSize),
                            recognizer: TapGestureRecognizer()
                              ..onTap = (){
                                _sendMail();
                              }
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    children: [
                      Icon(Icons.web, size: widget.iconSize),
                      SizedBox(width: 15),
                      RichText(
                        text: TextSpan(
                            text: 'Web stranica',
                            style: TextStyle(color: Colors.blue[900], fontSize: widget.textSize),
                            recognizer: TapGestureRecognizer()
                              ..onTap = (){
                                _openUrl2();
                              }
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    children: [
                      Icon(FontAwesome.clock_o, size: widget.iconSize),
                      SizedBox(width: 15,),
                      Text('Cijelo vrijeme',
                          style: TextStyle(fontSize: widget.textSize, color: widget.textColor)
                      )
                    ],
                  ),
                  Wrap(
                    children: [
                      Icon(Icons.accessibility_new, size: widget.iconSize),
                      SizedBox(width: 15),
                      Text('U potpunosti pristupačan',
                          style: TextStyle(fontSize: widget.textSize, color: widget.textColor)
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
