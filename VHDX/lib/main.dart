import 'package:flutter/material.dart';
import 'package:VHD/ManagerRoti.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  void adaugaRoataNoua(BuildContext cont){
    showModalBottomSheet(context:cont, builder: (BuildContext builderContext){
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
        getList("name"),
        getList("name"),
        getList("name"),
        getList("name"),
      ],);
    }  );
  }

  ListTile getList(String name){
    return ListTile(leading: Icon(Icons.cake),
    title: Text(name));
  }
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
          onPressed: ()=>adaugaRoataNoua(context),
        ),
      ),
    );
  }
}
