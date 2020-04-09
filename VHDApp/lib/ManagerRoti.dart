import 'package:flutter/material.dart';

import "package:VHD/Roata.dart";
import 'package:VHD/tipRoata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManagerRoti {
  List<Roata> _listaRoti;
  static ManagerRoti _instance;
  Roata _roataClone;
  Roata _roataCurenta;

  void setRoataCurenta(Roata roata)
  {
    _roataCurenta = roata;
  }

  Roata get getRoataCurenta
  {
    return _roataCurenta;
  }

  void setRoataClone(Roata roata)
  {
   _roataClone = roata;
  }

  ManagerRoti._internal() {
    _listaRoti = new List();
    _generateDummyData();
  }

  _generateDummyData() async {
    Firestore _firestore = Firestore.instance;
    QuerySnapshot allDocuments = await _firestore.collection('roti').getDocuments();
    allDocuments.documents.forEach((element) {
      print("elements");
       _listaRoti.add(Roata(
              //  pretCumparare: element['pretCumparare'],
                pretVanzare: 0,
                latime:  element['latime'],
                balonaj: element['balonaj'],
                r: element['r'],
                marca: element['marca'],
                tip: TipRoata.Vara));
     });
  }

  static ManagerRoti getManagerRoti() {
    if (_instance == null) _instance = new ManagerRoti._internal();
    return _instance;
  }

 List<Widget> filterByFirma(String firma, BuildContext context){
   return _listaRoti.where((r)=>r.marca==firma).map((r){return r.widget(context);}).toList();
  }

  List<Widget> widgetRotiList(BuildContext context) {
    return _listaRoti.map((roata) {
      return roata.widget(context);
    }).toList();
  }

  void addRoata(Roata roata)
  {
    _listaRoti.add(roata);
    Firestore.instance.collection('roti').document().setData({
      'iD':roata.iD.toString(),
      'marca':roata.marca,
      'tip':roata.tip.toString(),
      'latime':roata.latime,
      'balonaj':roata.balonaj,
      'r':roata.r,
      'pretCumparare':roata.pretCumparare.toString(),
      'pretVanzare':roata.pretVanzare.toString(),
      'dataIntrare':roata.dataIntrare.toString(),
      'disponibil':true
      });


  }

  void cautaDupaTip()
  {
    _listaRoti = new List();
    Firestore.instance
    .collection('roti')
    .where("marca", isEqualTo: "debica")
    .snapshots()
    .listen((data) =>
        data.documents.forEach((element) => {
              _listaRoti.add(Roata(
              //  pretCumparare: element['pretCumparare'],
                pretVanzare: 0,
                latime:  element['latime'],
                balonaj: element['balonaj'],
                r: element['r'],
                marca: element['marca'],
                tip: TipRoata.Vara))
     }));  

  }
}
