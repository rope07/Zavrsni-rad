import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio/skup_lokacija/tekstovi.dart';
import 'package:url_launcher/url_launcher.dart';

class HotelZoo extends StatefulWidget {

  double textSize;
  double iconSize;
  Color textColor;
  HotelZoo({Key key, this.textSize, this.iconSize, this.textColor}) : super(key: key);

  @override
  _HotelZooState createState() => _HotelZooState();
}

class _HotelZooState extends State<HotelZoo> {

  Tekstovi tekst = Tekstovi();

  void _calling() async {
    const url = 'tel:+385031544000';
    if(await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _sendMail() async {
    const url = 'https://zoo-hotel.hr/kontakt/';
    if(await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _openUrl() async {
    const url = 'https://zoo-hotel.hr/';
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
          'Hotel Zoo',
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
            Image.asset('assets/hotel_zoo.jpg'),
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
                              text: 'https://zoo-hotel.hr/',
                              style: TextStyle(color: Colors.blue[900], fontSize: widget.textSize),
                              recognizer: TapGestureRecognizer()
                                ..onTap = (){
                                  _openUrl();
                                }
                          ),
                        ),
                      ],
                    )
                  ],
                )
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
                        'Sjevernodravska obala bb',
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
                            text: '+385 (0)31 544 000',
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
                            text: 'Kontakt obrazac hotela',
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
                                _openUrl();
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
                          style: TextStyle(fontSize: widget.textSize, color: Colors.yellow)
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
