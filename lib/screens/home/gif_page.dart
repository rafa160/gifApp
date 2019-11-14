import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:give_me_gifs/screens/full_gif/full_gif_page.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

class GifPage extends StatefulWidget {
  @override
  _GifPageState createState() => _GifPageState();
}

class _GifPageState extends State<GifPage> {
  String _search;

  int _offset = 0;

  int _getCount(List data){
    if(_search == null){
      return data.length;
    } else {
      return data.length + 1;
    }
  }

  Future<Map> _getGifs() async {
    http.Response response;

    if (_search == null || _search.isEmpty)
      response = await http.get(
          "https://api.giphy.com/v1/gifs/trending?api_key=kgjyH2seUHKX2MSzQW1YVcOCBkkEWDqJ&limit=20&rating=G");
    else
      response = await http.get(
          "https://api.giphy.com/v1/gifs/search?api_key=kgjyH2seUHKX2MSzQW1YVcOCBkkEWDqJ&q=$_search&limit=19&offset=$_offset&rating=G&lang=pt");
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    _getGifs().then((map) {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(35, 36, 59, 1),
        title: Image.network(
            "https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
        centerTitle: true,
      ),
      backgroundColor: Color.fromRGBO(35, 36, 59, 1),
      body: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(10),
              child: _searchGifs(),
          ),
          Expanded(
            child: FutureBuilder(
              future: _getGifs(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Container(
                      width: 200,
                      height: 200,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 5.0,
                      ),
                    );
                  default:
                    if (snapshot.hasError) {
                      return Container();
                    } else {
                      return _createGifTable(context, snapshot);
                    }
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _createGifTable(BuildContext context, AsyncSnapshot snapshot) {
    return GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: _getCount(snapshot.data["data"]),
        itemBuilder: (context, index) {
          if(_search == null || index < snapshot.data["data"].length){
            return GestureDetector(
              //caminho deve ser verificado em o que json retorna
              child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image:snapshot.data["data"][index]["images"]["fixed_height"]["url"],
              height: 300,
              fit: BoxFit.cover,),
              onTap: (){
                Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => FullGifPage(snapshot.data["data"][index]))
                );
              },
              onLongPress: (){
                Share.share(snapshot.data["data"][index]["images"]["fixed_height"]["url"]);
              },
            );
          } else {
            return Container(
              child: GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.add, color: Colors.white, size: 60,
                    ),
                    Text("Carregar mais...", style: TextStyle( color: Colors.white, fontSize: 20),),
                  ],
                ),
                onTap: (){
                  setState(() {
                    _offset += 19;
                  });
                },
              ),
            );
          }

        });
  }

  Widget _searchGifs() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Pesquise aqui",
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            )),
      ),
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      textAlign: TextAlign.center,
      onSubmitted: (text) {
        setState(() {
          _search = text;
          _offset = 0;
        });
      },
    );
  }
}
