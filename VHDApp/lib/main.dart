import 'package:flutter/material.dart';
import 'package:VHD/ManagerRoti.dart';
import 'package:VHD/AdaugareRoata.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: <String, WidgetBuilder>{
      "/": (BuildContext context) => new MyApp(),
      "/AdaugareRoataPage": (BuildContext context) => new AdaugareRoataPage()
    },
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListareRotiMyAppState();
  }
}

class ListareRotiMyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vulcanizare Alex',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Vulcanizare Alex'),
        ),
        body: ListView(
          padding: EdgeInsets.all(2),
          children: ManagerRoti.getManagerRoti()
              .widgetRotiList(), //<Widget>[ TextField(decoration: InputDecoration(labelText: 'Test'))],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed("/AdaugareRoataPage");
          },
        ),
      ),
    );
  }
}
