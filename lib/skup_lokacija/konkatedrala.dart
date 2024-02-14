import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio/skup_lokacija/tekstovi.dart';
import 'package:url_launcher/url_launcher.dart';

class Konkatedrala extends StatefulWidget {

  double textSize;
  double iconSize;
  Color textColor;
  Konkatedrala({Key key, this.textSize, this.iconSize, this.textColor}) : super(key: key);

  @override
  _KonkatedralaState createState() => _KonkatedralaState();
}

class _KonkatedralaState extends State<Konkatedrala> {

  Tekstovi tekst = Tekstovi();

  void _calling() async {
    const url = 'tel:+385031310020';
    if(await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _sendMail() async {
    const url = 'mailto:zupa@svpetaripavao.hr';
    if(await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _openUrl() async {
    const url = 'https://www.svpetaripavao.hr/';
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
          'Konkatedrala sv. Petra i Pavla',
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
            Image.asset('assets/konkatedrala.jpg'),
            SizedBox(height: 30),
            Container(
                margin: EdgeInsets.fromLTRB(15, 0, 5, 0),
                child: Column(
                  children: [
                    Text(
                      tekst.konkatedrala,
                      style: TextStyle(fontSize: widget.textSize, color: widget.textColor),
                    ),
                    SizedBox(height: 20),
                    Wrap(
                      children: [
                        Text('izvor: ', style: TextStyle(fontSize: widget.textSize, color: widget.textColor)),
                        RichText(
                          text: TextSpan(
                              text: 'https://www.svpetaripavao.hr/',
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
                        'Ul. Pavla Pejačevića 1',
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
                            text: '+385 31 310 020',
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
                            text: 'zupa@svpetaripavao.hr',
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
                      Icon(Icons.email, size: widget.iconSize),
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
                      Text('Župni ured : Radnim danom 8.00-12.00 i 15.00-18.00, a subotom 8.00-12.00',
                          style: TextStyle(fontSize: widget.textSize, color: widget.textColor)
                      )
                    ],
                  ),
                  Wrap(
                    children: [
                      Icon(Icons.accessibility_new, size: widget.iconSize),
                      SizedBox(width: 15),
                      Text('Trenutačno nepristupačna, u planu je ugraditi pristupačne sadržaje.',
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