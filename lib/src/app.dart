import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import './models/json_model.dart';
import './widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int idInt = 0;
  List<JsonModel> jsonModel = [];

  myClickFloating() async {
    print('You Click Floating');
    idInt += 1;
    print('idInt = $idInt');

    var response = await get(
        'https://www.androidthai.in.th/sun/getFoodWhereIdMaster.php?isAdd=true&id=$idInt');
    var converted =json.decode(response.body);
    print('converted ==> $converted');

    for (var data in converted) {

      print('data ==> $data');
      var objJsonModel =JsonModel.fromJson(data);
      print('$objJsonModel');

      setState(() {
        jsonModel.add(objJsonModel);
      });
      
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sun Food',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sun Food'),
          leading: Icon(Icons.fastfood),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_shopping_cart),
          onPressed: () {
            myClickFloating();
          },
        ),
        body: ImageList(jsonModel),
      ),
    );
  }
}
