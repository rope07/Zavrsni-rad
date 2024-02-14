import 'package:flutter/material.dart';
import 'package:portfolio/main2.dart';
import 'package:portfolio/teme.dart';
import 'package:provider/provider.dart';
import 'package:portfolio/stranice/pocetna.dart';
import 'package:portfolio/stranice/lokacije.dart';
import 'package:portfolio/stranice/karta.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Color boja_teksta = Colors.black;
  Color boja_pozadine = Colors.white;

  /*void promijeni_boju(index) async {
    setState(() {
      boja_teksta = teme[index].boja_teksta;
      boja_pozadine = teme[index].boja_pozadine;
    });
  }*/

  String defaultFontFamily = 'Roboto-Regular';

  void changeFont() async {
    setState(() {
      if(defaultFontFamily == 'Roboto-Regular'){
        defaultFontFamily = 'OpenDyslexic-Regular';
      } else {
        defaultFontFamily = 'Roboto-Regular';
      }
    });
  }

  double defaultFontSize = 18;
  double defaultIconSize = 23;

  void incFontSize() async {
    setState(() {
      defaultFontSize += 3;
    });
  }

  void decFontSize() async {
    setState(() {
      defaultFontSize -= 3;
    });
  }

  void incIconSize() async {
    setState(() {
      defaultIconSize += 3;
    });
  }

  void decIconSize() async {
    setState(() {
      defaultIconSize -= 3;
    });
  }

  int _selectedTab = 0;
  String _title = 'Početna';
  final _pageOptions = [
    PocetnaPage(),
    LokacijePage(),
    KartaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeModel>(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(
        builder: (_, model, __){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.grey,
            accentColor: Colors.green,
            fontFamily: defaultFontFamily
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: defaultFontFamily
          ),
          themeMode: model.mode,
          home: Scaffold(
            resizeToAvoidBottomInset: false,

            //Zaglavlje aplikacije - naslov se mijenja u skladu s odabranom stranicom
            appBar: AppBar(
              title: Text(_title, style: TextStyle(fontSize: 28)),
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
                IconButton(
                  icon: Icon(Icons.wb_sunny_outlined),
                  onPressed: () => model.toggleMode(),
                ),
              ],
            ),

            drawer: Drawer(
              child: Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 250, 10, 0),
                  child: Column(
                    children: [
                      FlatButton(
                        //onPressed: () {promijeni_boju(0);},
                        child: Text(
                          'Stil 1',
                          style: TextStyle(fontSize: 25),
                        ),
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1,
                                style: BorderStyle.solid
                            ),
                            borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                      FlatButton(
                        //onPressed: () {promijeni_boju(1);},
                        child: Text(
                          'Stil 1',
                          style: TextStyle(fontSize: 25),
                        ),
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1,
                                style: BorderStyle.solid
                            ),
                            borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                      FlatButton(
                        //onPressed: () {promijeni_boju(2);},
                        child: Text(
                          'Stil 2',
                          style: TextStyle(fontSize: 25),
                        ),
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1,
                                style: BorderStyle.solid
                            ),
                            borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                      FlatButton(
                        //onPressed: () {promijeni_boju(3);},
                        child: Text(
                          'Stil 3',
                          style: TextStyle(fontSize: 25),
                        ),
                        color: Colors.yellowAccent,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              style: BorderStyle.solid
                            ),
                          borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                      FlatButton(
                        //onPressed: () {promijeni_boju(4);},
                        child: Text(
                          'Stil 4',
                          style: TextStyle(fontSize: 25),
                        ),
                        color: Colors.grey[600],
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1,
                                style: BorderStyle.solid
                            ),
                            borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //Tijelo aplikacije - stranice se mijenjaju klikom na ikonice u donjem izborniku
            body: _pageOptions[_selectedTab],
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                changeFont();
              },
              tooltip: 'Promijeni font',
              child: Icon(Icons.font_download_outlined),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedTab,

              onTap: (int index){
                setState(() {
                  _selectedTab = index;
                  if(index == 0) _title = 'Početna';
                  if(index == 1) _title = 'Lokacije';
                  if(index == 2) _title = 'Karta';
                });
              },

              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Početna')),
                BottomNavigationBarItem(icon: Icon(Icons.edit_location), title: Text('Lokacije')),
                BottomNavigationBarItem(icon: Icon(Icons.map_outlined), title: Text('Karta')),
              ],
              iconSize: 30,
              selectedFontSize: 26,
              selectedItemColor: Colors.red[500],
            ),
          ),
        );
        }
      ),
    );
  }
}

class ThemeModel with ChangeNotifier {
  ThemeMode _mode;
  ThemeMode get mode => _mode;
  ThemeModel({ThemeMode mode = ThemeMode.light}) : _mode = mode;

  void toggleMode(){
    _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}




