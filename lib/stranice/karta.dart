import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart' as latLng;
import 'package:portfolio/skup_lokacija/skup_stranica.dart';

class KartaPage extends StatefulWidget {

  double textSize;
  double iconSize;
  Color textColor;

  KartaPage({Key key, this.textSize, this.iconSize, this.textColor}) : super(key: key);

  @override
  _KartaPageState createState() => _KartaPageState();
}

class _KartaPageState extends State<KartaPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Karta"),
        centerTitle: true,
      ),
      body: FlutterMap(
        options: MapOptions(
          center: latLng.LatLng(45.4609447,18.8111033),
          zoom: 10.0,
        ),
        layers: [
          TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 100.0,
                height: 100.0,
                point: latLng.LatLng(45.5596859, 18.6956945),
                builder: (ctx) =>
                new Container(
                  child: Column(
                    children: [
                      Icon(Icons.museum_outlined),
                      Text(
                        'Arheološki muzej',
                        style: TextStyle(
                            fontSize: 18
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              Marker(
                width: 100.0,
                height: 100.0,
                point: latLng.LatLng(45.4862276,18.9890593),
                anchorPos: AnchorPos.align(AnchorAlign.center),
                builder: (ctx) =>
                new Container(
                  child: Column(
                    children: [
                      Icon(Icons.museum_outlined),
                      Text(
                        'Rodna kuća Milutina Milankovića',
                        style: TextStyle(
                            fontSize: 18
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              Marker(
                width: 100.0,
                height: 100.0,
                point: latLng.LatLng( 45.5686912,18.6653564),
                anchorPos: AnchorPos.align(AnchorAlign.center),
                builder: (ctx) =>
                new Container(
                  child: Column(
                    children: [
                      Icon(Icons.hotel),
                      Text(
                        'Hotel Zoo',
                        style: TextStyle(
                            fontSize: 18
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              Marker(
                width: 100.0,
                height: 100.0,
                point: latLng.LatLng(45.5620559,18.6793539),
                anchorPos: AnchorPos.align(AnchorAlign.center),
                builder: (ctx) =>
                new Container(
                  child: Column(
                    children: [
                      Icon(Icons.hotel),
                      Text(
                        'Hotel Osijek',
                        style: TextStyle(
                            fontSize: 18
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              Marker(
                width: 100.0,
                height: 100.0,
                point: latLng.LatLng(45.560795,18.675501),
                anchorPos: AnchorPos.align(AnchorAlign.center),
                builder: (ctx) =>
                new Container(
                  child: Column(
                    children: [
                      Icon(FontAwesome5Solid.church),
                      Text(
                        'Konkatedrala',
                        style: TextStyle(
                            fontSize: 16
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
