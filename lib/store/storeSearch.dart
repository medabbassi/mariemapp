import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'hotel_app_theme.dart';

class StoreSearch extends StatefulWidget {
  @override
  _StoreSearchState createState() => _StoreSearchState();
}

class _StoreSearchState extends State<StoreSearch> {
  var _searchEdit = new TextEditingController();

  bool _isSearch = true;
  String _searchText = "";
  List _items = [];
  List<String> _socialListItems;
  List<String> _searchListItems;
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["stores"];
    }); }

  @override
  void initState() {
    super.initState();
    readJson();
    _socialListItems = new List<String>();
    _socialListItems = [
      'Tunis','Sfax','Sousse','Kairouan','Bizerte','Gabes','Ariana','Kasserine'
      ,'Gafsa','Ben Arous','Monastir','Tataouine','Medenine	','Beja	','Nabeul','Jendouba','El Kef',
      'Mahdia','Sidi Bouzid','Tozeur','Siliana','Kebili','Zaghouan'
    ];
    _socialListItems.sort();
  }

  _StoreSearchState() {
    _searchEdit.addListener(() {
      if (_searchEdit.text.isEmpty) {
        setState(() {
          _isSearch = true;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearch = false;
          _searchText = _searchEdit.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Chercher sur les villes disponible"),
        backgroundColor:  HexColor('#00C6AD'),
      ),
      body: new Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: new Column(
          children: <Widget>[
            _searchBox(),
            _isSearch ? _listView() : _searchListView()
          ],
        ),
      ),
    );
  }

  Widget _searchBox() {
    return new Container(
      decoration: BoxDecoration(border: Border.all(width: 1.0)),
      child: new TextField(
        controller: _searchEdit,
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: new TextStyle(color: Colors.grey[300]),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _listView() {
    return new Flexible(
      child: new ListView.builder(
          itemCount: _items.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              color: Colors.cyan[50],
              elevation: 5.0,
              child: new Container(
                margin: EdgeInsets.all(15.0),
                child: ListTile(
                  title: Text(_items[index]['name']),
                  subtitle: Text("N° tel: "+_items[index]["phone"]),
                )
                //new Text("${_socialListItems[index]}"),
              ),
            );
          }),
    );
  }

  Widget _searchListView() {
    _searchListItems = new List<String>();
    for (int i = 0; i < _socialListItems.length; i++) {
      var item = _socialListItems[i];

      if (item.toLowerCase().contains(_searchText.toLowerCase())) {
        _searchListItems.add(item);
      }
    }
    return _searchAddList();
  }


  Widget _searchAddList() {


      return new Flexible(
        child: new ListView.builder(
            itemCount: _searchListItems.length,
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                color: Colors.cyan[100],
                elevation: 5.0,
                child: new Container(
                    margin: EdgeInsets.all(15.0),
                    child:ListTile(
                      title: Text(_items[index]['name']),
                      subtitle: Text("N° tel: "+_items[index]["phone"]),
                    ),
                    ),
      );

            }),
      );
    }


}
class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
