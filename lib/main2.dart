import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio/skup_lokacija/arh_muzej.dart';
import 'package:portfolio/skup_lokacija/hotel_osijek.dart';
import 'package:portfolio/skup_lokacija/hotel_zoo.dart';
import 'package:portfolio/skup_lokacija/konkatedrala.dart';
import 'package:portfolio/skup_lokacija/rod_kuc_milut_milan.dart';
import 'package:portfolio/skup_lokacija/skup_stranica.dart';
import 'package:portfolio/stranice/karta.dart';
import 'package:portfolio/stranice/pocetna.dart';
import 'package:portfolio/teme.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String fontFamily = 'Roboto-Regular';
  double fontSize = 18;
  double iconSize = 25;
  Color bodyColor = Colors.white;
  Color primaryColor = Colors.black;
  Color textColor = Colors.black;
  Color primaryText = Colors.white;

  List<Stranica> stranice = [
    Stranica(ime: 'O aplikaciji', index: 1, ikona: Icon(Icons.home), lokacijaSlike: 'assets/osijek.jpg'),
    Stranica(ime: 'Arheološki muzej', index: 2, ikona: Icon(Icons.museum_outlined), lokacijaSlike: 'assets/arh_muzej.jpg'),
    Stranica(ime: 'Rodna kuća Milutina Milankovića', index: 3, ikona: Icon(Icons.museum_outlined), lokacijaSlike: 'assets/milutin_milankovic.jpg'),
    Stranica(ime: 'Hotel Osijek', index: 4, ikona: Icon(Icons.hotel), lokacijaSlike: 'assets/hotel_osijek.jpg'),
    Stranica(ime: 'Hotel Zoo', index: 5, ikona: Icon(Icons.hotel), lokacijaSlike: 'assets/hotel_zoo.jpg'),
    Stranica(ime: 'Konkatedrala sv. Petra i Pavla', index: 6, ikona: Icon(FontAwesome5Solid.church), lokacijaSlike: 'assets/konkatedrala.jpg'),
    Stranica(ime: 'Karta', index: 7, ikona: Icon(Icons.map_outlined), lokacijaSlike: 'assets/karta_osijek.jpg')
  ];


  List<Tema> teme = [
    Tema(primary: Colors.black, primaryText: Colors.white, body: Colors.white, text: Colors.black, ime: "početna"),
    Tema(primary: Colors.black, primaryText: Colors.amber, body: Colors.black, text: Colors.amber, ime: "crno-žuta"),
    Tema(primary: Colors.lightBlue, primaryText: Colors.amber, body: Colors.lightBlue, text: Colors.amber, ime: "plavo-žuta"),
    Tema(primary: Colors.green, primaryText: Colors.black, body: Colors.green, text: Colors.black, ime: "zeleno-crna"),
    Tema(primary: Colors.red[600], primaryText: Colors.black, body: Colors.red[600], text: Colors.black, ime: "crveno-crna"),
    Tema(primary: Colors.black, primaryText: Colors.white, body: Colors.black, text: Colors.white, ime: "crno-bijela")
  ];

  Tema odabranaTema = Tema(primary: Colors.grey, body: Colors.white, text: Colors.black, ime: "početna");

  void select_theme(Tema tema){
    if(tema == teme[0]) changeTheme(0);
    if(tema == teme[1]) changeTheme(1);
    if(tema == teme[2]) changeTheme(2);
    if(tema == teme[3]) changeTheme(3);
    if(tema == teme[4]) changeTheme(4);
    if(tema == teme[5]) changeTheme(5);
    setState(() {
      odabranaTema = tema;
    });
  }

  void pickPage(context, index){
    switch(index){
      case 1:
        Navigator.pushNamed(context, '/o_aplikaciji');
        break;
      case 2:
        Navigator.pushNamed(context, '/arh_muzej');
        break;
      case 3:
        Navigator.pushNamed(context, '/rod_kuc');
        break;
      case 4:
        Navigator.pushNamed(context, '/hotel_osijek');
        break;
      case 5:
        Navigator.pushNamed(context, '/hotel_zoo');
        break;
      case 6:
        Navigator.pushNamed(context, '/konkatedrala');
        break;
      case 7:
        Navigator.pushNamed(context, '/karta');
    }
  }


  void changeFont() async {
    setState(() {
      if(fontFamily == 'Roboto-Regular'){
        fontFamily = 'OpenDyslexic-Regular';
      } else {
        fontFamily = 'Roboto-Regular';
      }
    });
  }

  void incFontSize() async {
    setState(() {
      fontSize += 3;
    });
  }

  void decFontSize() async {
    setState(() {
      fontSize -= 3;
    });
  }

  void incIconSize() async {
    setState(() {
      iconSize += 3;
    });
  }

  void decIconSize() async {
    setState(() {
      iconSize -= 3;
    });
  }

  void changeTheme(index) async {
    setState(() {
      primaryColor = teme[index].primary;
      bodyColor = teme[index].body;
      textColor = teme[index].text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/o_aplikaciji': (context) => PocetnaPage(textSize: fontSize, iconSize: iconSize, textColor: textColor, backColor: bodyColor),
        '/arh_muzej': (context) => ArhMuzej(textSize: fontSize, iconSize: iconSize, textColor: textColor),
        '/rod_kuc': (context) => RodKucMilutMilan(textSize: fontSize, iconSize: iconSize, textColor: textColor),
        '/hotel_osijek': (context) => HotelOsijek(textSize: fontSize, iconSize: iconSize, textColor: textColor),
        '/hotel_zoo': (context) => HotelZoo(textSize: fontSize, iconSize: iconSize, textColor: textColor),
        '/konkatedrala': (context) => Konkatedrala(textSize: fontSize, iconSize: iconSize, textColor: textColor),
        '/karta': (context) => KartaPage(textSize: fontSize, iconSize: iconSize, textColor: textColor)
      },

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: primaryColor,
          primaryTextTheme: TextTheme(
            headline6: TextStyle(
              color: primaryText
            )
          ),
          scaffoldBackgroundColor: bodyColor,
          accentColor: Colors.green,
          cardColor: bodyColor,
          fontFamily: fontFamily,
          popupMenuTheme: PopupMenuThemeData(
            color: bodyColor,
            textStyle: TextStyle(color: textColor)
          )
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Pristupačni Osijek",
            style: TextStyle(fontSize: 20),
          ),
          centerTitle: true,
          actions: [
            PopupMenuButton(
              elevation: 3.2,
              onSelected: select_theme,
              itemBuilder: (BuildContext context){
                return teme.map((Tema tema) {
                   return PopupMenuItem(
                     value: tema,
                     child: Text(tema.ime),
                   );
                }).toList();
              },
            )
          ],
        ),
        body: ListView.builder(
            itemCount: stranice.length,
            itemBuilder: (context, index){
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: GestureDetector(
                  onTap: () {
                    pickPage(context, stranice[index].index);
                    },
                  child: Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            stranice[index].ime,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                                color: textColor
                            ),
                          ),
                          contentPadding: EdgeInsets.all(10.0),
                        ),
                        Image.asset(
                          stranice[index].lokacijaSlike,
                          width: 100.0,
                          height: 100.0,
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
            ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            changeFont();
            },
          tooltip: 'Promijeni font',
          child: Icon(Icons.font_download_outlined),
        ),
      ),
    );
  }
}