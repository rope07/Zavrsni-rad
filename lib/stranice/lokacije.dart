import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/skup_lokacija/skup_stranica.dart';
import 'package:portfolio/skup_lokacija/arh_muzej.dart';
import 'package:portfolio/skup_lokacija/rod_kuc_milut_milan.dart';
import 'package:portfolio/skup_lokacija/hotel_osijek.dart';
import 'package:portfolio/skup_lokacija/hotel_zoo.dart';

class LokacijePage extends StatefulWidget {
  @override
  _LokacijePageState createState() => _LokacijePageState();
}

class _LokacijePageState extends State<LokacijePage> {

  List<Stranica> lokacije = [
    Stranica(ime: 'Arheološki muzej', index: 1, ikona: Icon(Icons.museum_outlined), lokacijaSlike: 'assets/arh_muzej.jpg'),
    Stranica(ime: 'Rodna kuća Milutina Milankovića', index: 2, ikona: Icon(Icons.museum_outlined), lokacijaSlike: 'assets/milutin_milankovic.jpg'),
    Stranica(ime: 'Hotel Osijek', index: 3, ikona: Icon(Icons.hotel), lokacijaSlike: 'assets/hotel_osijek.jpg'),
    Stranica(ime: 'Hotel Zoo', index: 4, ikona: Icon(Icons.hotel), lokacijaSlike: 'assets/hot_zoo.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        itemCount: lokacije.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(_createRoute(lokacije[index].index));
              },
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        lokacije[index].ime,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0
                        ),
                      ),
                      leading: lokacije[index].ikona,
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                    Image.asset(
                      lokacije[index].lokacijaSlike,
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
    );
  }
}

Route _createRoute(index){

  Widget lokacija;

  switch(index){
    case 1:
      lokacija = ArhMuzej();
      break;
    case 2:
      lokacija = RodKucMilutMilan();
      break;
    case 3:
      lokacija = HotelOsijek();
      break;
    case 4:
      lokacija = HotelZoo();
      break;
  }

  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => lokacija,
    transitionsBuilder: (context, animation, secondaryAnimation, child){
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    }
  );
}