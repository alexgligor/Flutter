import 'package:flutter/material.dart';
import 'package:VHD/ManagerRoti.dart';
import 'Roata.dart';
	
import 'package:intl/intl.dart';

class AfisareRoataPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AfisareRoata();
  }
}

class AfisareRoata extends State<AfisareRoataPage> {
  Roata _roata = ManagerRoti.getManagerRoti().getRoataCurenta;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Articol "+ _roata.serialNumber.toString()), backgroundColor: Colors.blueAccent),
      body: ListView(
        children: <Widget>[widgetIntroducereRoata()],
        )
    );
  }

  

  Widget widgetIntroducereRoata() {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text( 'Marca: '+ _roata.marca ),
            Text("Tip: "+ _roata.tip.toString()),
            Text('Dimensiuni: ' + _roata.balonaj.toString() +"/"+_roata.latime.toString() +"/r" + _roata.r.toString() ),
            Text('Pret: '+_roata.pretVanzare.toString() + " RON"),     
            Text('Data intrare: ' +  dateTimeToString(_roata.dataIntrare)  ),
            Text('Data iesire: ' +  dateTimeToString(_roata.dataIesire)  )
          ],
        ),
      ),
    );
  }

  String dateTimeToString(DateTime date)
  {
    if(date == null)
      return "n/a";

    return DateFormat.yMd().add_jm().format(date) ;
  }
}