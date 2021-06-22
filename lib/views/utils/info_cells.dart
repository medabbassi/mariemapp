
import 'dart:convert';

import 'package:coeliqueapplication/utils/he_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../doctor.dart';

class InfoCells extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _InfoCells();
  }
}

class _InfoCells  extends State<InfoCells>
{
  final Doctor doctor;
  List _items = [];

  _InfoCells({this.doctor});
  @override
  void initState() {
    // TODO: implement initState
    readJson();
    super.initState();
  }
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["doctors"];
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        height: 100,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              color: HexColor('#404B63').withOpacity(0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            _imageSection(),
            SizedBox(
              width: 16,
            ),
            _detailsSection(),
          ],
        ),
      ),
    );
  }

  /// **********************************************
  /// WIDGETS
  /// **********************************************
  Container _imageSection() {
    return Container(
      height: 77,
      width: 90,
      decoration: BoxDecoration(
        color: HexColor('#00c6AD'),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/images/doctor1.jpg'),
        ),
      ),
    );
  }

  /// Details Section
  ///
  Column _detailsSection() {
    return Column(
      children: [
       /* ElevatedButton(
          child: Text('Load Data'),
          onPressed: readJson,
        ),*/

        // Display the data loaded from sample.json
        _items.length > 0
            ? Expanded(
            child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(

                  title: Text(_items[index]["fullname"]),
                  subtitle: Text(_items[index]["speciality"]),
                ),
              );
            },
          ),
        )
            : Container()
      ],
    );
  }
}


