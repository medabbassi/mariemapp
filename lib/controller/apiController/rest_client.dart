import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import '../../doctor.dart';

class RestClient extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _RestClientRes();
  }
}
class _RestClientRes extends State<RestClient>{
  final Doctor doctor;
  List _items = [];

  _RestClientRes({this.doctor});
  @override
  void initState() {
    readJson();
    super.initState();
  }
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            ElevatedButton(
              child: Text('Load Data'),
              onPressed: readJson,
            ),

            // Display the data loaded from sample.json
            _items.length > 0
                ? Expanded(
                  child: ListView.builder(
                    itemCount: _items.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.all(10),
                             child: ListTile(
                               leading: Text(_items[index]["id"]),
                                title: Text(_items[index]["name"]),
                              subtitle: Text(_items[index]["description"]),
                    ),
                  );
                },
              ),
            )
                : Container()
          ],
        ),
      ),
    );
  }
}