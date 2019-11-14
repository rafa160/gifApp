import 'package:flutter/material.dart';
import 'package:share/share.dart';

class FullGifPage extends StatelessWidget {

  final Map _gifData;

  FullGifPage(this._gifData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_gifData["title"]),
        backgroundColor: Color.fromRGBO(35, 36, 59, 1),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){
              Share.share(_gifData["images"]["fixed_height"]["url"]);
            },
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(35, 36, 59, 1),
      body: Center(
        child: Image.network(
          _gifData["images"]["fixed_height"]["url"]
        ),
      ),
    );
  }
}

