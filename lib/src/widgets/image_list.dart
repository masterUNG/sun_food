import 'package:flutter/material.dart';
import '../models/json_model.dart';

class ImageList extends StatelessWidget {
  List<JsonModel> jsonModel;
  ImageList(this.jsonModel);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jsonModel.length,
      itemBuilder: (context, int index) {
        return Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.blue), color: Colors.blue),
          padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Image.network(jsonModel[index].url),
              Text(
                jsonModel[index].title,
                style: TextStyle(fontSize: 25.0),
              )
            ],
          ),
        );
      },
    );
  }
}
