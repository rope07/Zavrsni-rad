import 'package:flutter/cupertino.dart';

class Stranica {

  String ime;
  int index;
  Icon ikona;
  double lat, lng;
  String lokacijaSlike;

  Stranica({
    this.ime,
    this.index,
    this.ikona,
    this.lokacijaSlike,
    this.lat,
    this.lng
  });
}