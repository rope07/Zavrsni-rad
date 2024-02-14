import 'package:flutter/material.dart';
import 'package:portfolio/skup_lokacija/tekstovi.dart';

class PocetnaPage extends StatefulWidget {

  double textSize;
  double iconSize;
  Color textColor;
  Color backColor;


  PocetnaPage({Key key, this.textSize, this.iconSize, this.textColor, this.backColor}) : super(key: key);

  @override
  _PocetnaPageState createState() => _PocetnaPageState();
}

class _PocetnaPageState extends State<PocetnaPage> {

  Tekstovi tekst = Tekstovi();

  String locationFerLogo = 'assets/fer_logo_bijeli.jpg';

  void setFerLogo() async{
    setState(() {
      if(widget.backColor == Colors.black){
        locationFerLogo = 'assets/fer_logo_crni.jpg';
      }
      else{
        locationFerLogo = 'assets/fer_logo_bijeli.jpg';
      }
    });
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
    setFerLogo();

    return Scaffold(

      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("O aplikaciji", style: TextStyle(fontSize: 22)),
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
      body: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(locationFerLogo, height: 75, width: 75),
                  Image.asset('assets/ict-aac-logo.jpg', height: 75, width: 75)
                ],
              ),
              SizedBox(height: 30.0),
              Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Text(
                    tekst.pocetna,
                    style: TextStyle(fontSize: widget.textSize, color: widget.textColor),
                  ),
                ),
            ],
          ),
        ),
      )
    );
  }
}
