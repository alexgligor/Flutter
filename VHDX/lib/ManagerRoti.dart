import 'package:flutter/material.dart';

import "package:VHD/Roata.dart";
import 'package:VHD/tipRoata.dart';

class ManagerRoti {
  List<Roata> _listaRoti;
  static ManagerRoti _instance;

  ManagerRoti._internal() {
    _listaRoti = new List();
    _generateDummyData();
  }

  _generateDummyData() {
    for (int i = 0; i < 9; i++) {
      _listaRoti.add(Roata(
          pretCumparare: 145,
          pretVanzare: 180,
          latime: 255,
          balonaj: 55,
          r: 15,
          marca: "Continental",
          tip: TipRoata.Vara));
      _listaRoti.add(Roata(
          pretCumparare: 10,
          pretVanzare: 150,
          latime: 255,
          balonaj: 55,
          r: 16,
          marca: "Ducce",
          tip: TipRoata.Vara));
      _listaRoti.add(Roata(
          pretCumparare: 10,
          pretVanzare: 150,
          latime: 255,
          balonaj: 55,
          r: 17,
          marca: "F11",
          tip: TipRoata.Vara));
      _listaRoti.add(Roata(
          pretCumparare: 10,
          pretVanzare: 150,
          latime: 255,
          balonaj: 55,
          r: 19,
          marca: "Savoe",
          tip: TipRoata.Iarna));
      _listaRoti.add(Roata(
          pretCumparare: 10,
          pretVanzare: 150,
          latime: 255,
          balonaj: 55,
          r: 22,
          marca: "Rotti",
          tip: TipRoata.Vara));
      _listaRoti.add(Roata(
          pretCumparare: 10,
          pretVanzare: 150,
          latime: 255,
          balonaj: 55,
          r: 14,
          marca: "Continental",
          tip: TipRoata.AllSeasons));
      _listaRoti.add(Roata(
          pretCumparare: 10,
          pretVanzare: 150,
          latime: 255,
          balonaj: 55,
          r: 13,
          marca: "Debica",
          tip: TipRoata.Vara));
    }
  }

  static ManagerRoti getManagerRoti() {
    if (_instance == null) _instance = new ManagerRoti._internal();
    return _instance;
  }

 List<Widget> filterByFirma(String firma){
   return _listaRoti.where((r)=>r.marca==firma).map((r){return r.widget;}).toList();
  }

  List<Widget> widgetRotiList() {
    return _listaRoti.map((roata) {
      return roata.widget;
    }).toList();
  }
}
