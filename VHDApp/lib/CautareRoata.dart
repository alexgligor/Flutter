import 'package:VHD/tipRoata.dart';
import 'package:flutter/material.dart';
import 'package:VHD/ManagerRoti.dart';
import 'Roata.dart';
import 'package:vibration/vibration.dart';

class CautareRoataPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CautareRoata();
  }
}

class CautareRoata extends State<CautareRoataPage> {
  Roata _roata = new Roata(tip: TipRoata.AllSeasons, marca: "Continental");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Cautare Roata"), backgroundColor: Colors.deepOrange),
      body: ListView(
        children: <Widget>[widgetIntroducereRoata()],
        )
    );
  }

  List<DropdownMenuItem<String>> dropDownTipuriRoti()
  {
    return 
    [
      DropdownMenuItem<String>(
        child: Text("All Seasons"),
        value: TipRoata.AllSeasons.toString(),
      ),
      DropdownMenuItem<String>(
        child: Text("Iarna"),
        value: TipRoata.Iarna.toString(),
      ),
      DropdownMenuItem<String>(
        child: Text("Vara"),
        value: TipRoata.Vara.toString(),
      ),
      DropdownMenuItem<String>(
        child: Text("Alt Tip"),
        value: TipRoata.Other.toString(),
      ),
    ];
  }

  Widget widgetIntroducereRoata() {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Marca'),
              controller: TextEditingController(text: _roata.marca),
              onChanged: (val) => {_roata.marca = val},
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Pret'),
              controller: TextEditingController(
              text: _roata.pretVanzare != null ? _roata.pretVanzare.toString() : ""),
              keyboardType: TextInputType.number,
              onChanged: (val) => {
                _roata.pretVanzare = int.parse(val),
              },
            ),
            Container(
              child: DropdownButton<String>(
              value: _roata.tip.toString(),
              items: dropDownTipuriRoti(),
              onChanged: (String value) {
                setState(() {
                  _roata.tip = TipRoataHelper.getTipRoataFromString(value);
                });
              },
              hint: Text(_roata.tip.toString()),
              ),
            ),

            TextField(
              decoration: InputDecoration(labelText: 'Balonaj'),
              keyboardType: TextInputType.number,
              maxLength: 3,
              onChanged: (val) => {
                _roata.balonaj = int.parse(val),
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Raza'),
              keyboardType: TextInputType.number,
              maxLength: 2,
              onChanged: (val) => {
                _roata.r = int.parse(val),
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Latime'),
              keyboardType: TextInputType.number,
              maxLength: 3,
              onChanged: (val) => {
                _roata.latime = int.parse(val),
              },
            ),

            FlatButton(
              child: Text("Cauta"),
              color: Colors.lightGreen,
              onPressed: () => {
                ManagerRoti.getManagerRoti().cautaDupaTip(),
                Navigator.of(context).pushNamed("/")
              },
            ),
            // FlatButton(
            //   child: Text("Adauga si continua adaugarea"),
            //   color: Colors.redAccent,
            //   onPressed: () => {
            //     ManagerRoti.getManagerRoti().addRoata(_roata),
            //     _roata = new Roata(marca:_roata.marca, pretVanzare: _roata.pretCumparare, r: _roata.r,
            //     balonaj: _roata.balonaj, latime: _roata.latime, tip: _roata.tip),
            //   },
            // )
          ],
        ),
      ),
    );
  }
}