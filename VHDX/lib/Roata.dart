import "package:flutter/material.dart";
import 'package:intl/intl.dart';

import "./tipRoata.dart";

class Roata {
  static int index;
  int iD;
  DateTime dataIntrare;
  DateTime dataIesire;
  int latime;
  int balonaj;
  int r;
  String marca;
  TipRoata tip;
  double pretCumparare;
  double pretVanzare;
  bool disponibil = true;
  Roata(
      {this.marca,
      this.tip,
      this.latime,
      this.balonaj,
      this.r,
      this.pretCumparare,
      this.pretVanzare,
      this.dataIntrare,
      this.disponibil}) {
    if (this.dataIntrare == null) this.dataIntrare = DateTime.now();
    if (this.disponibil == null) this.disponibil = true;
   this.iD = index;
  // index+=1;
  }

  Widget get widget {
    return Card(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
       ListTile(
            leading: Icon(Icons.album, size: 40),
           title: Text('$marca $pretVanzare RONXX'),
           subtitle: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
             Padding(
                padding: EdgeInsets.all(4.0),
                child: Text('$latime/$balonaj R$r'),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  tip.toString().split('.')[1],
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(DateFormat.yMMMd().format(dataIntrare).toString()),
              )
            ])),
      ],
    ));
  }
}