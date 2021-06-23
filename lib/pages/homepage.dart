import 'dart:convert';

import 'package:coeliqueapplication/pages/detail_page.dart';
import 'package:coeliqueapplication/pages/hotel_app_theme.dart';
import 'package:coeliqueapplication/utils/he_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../doctor.dart';

class Homepg extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Homepg();
  }
}

class _Homepg extends State<Homepg> {
  List _items = [];
  @override
  void initState() {
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Les Medecines',
        ),
        backgroundColor: HexColor('#00c6ad'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            getSearchBarUI(),
            SizedBox(height: 10.0),
            ElevatedButton(
              child: Icon(Icons.sync_rounded),
              onPressed: readJson,
            ),
            SizedBox(height: 10.0),

            // Display the data loaded from sample.json
            _items.length > 0
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.all(10),
                          child: ListTile(
                            //leading: Text(_items[index]["id"]),
                            leading: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: 44,
                                minHeight: 44,
                                maxWidth: 44,
                                maxHeight: 44,
                              ),
                              child: Image.asset('assets/images/doctor1.jpg',
                                  fit: BoxFit.cover),
                            ),
                            title: Text(_items[index]["fullname"]),
                            subtitle: Text(_items[index]["specialty"]),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(),
                                      settings: RouteSettings(
                                          arguments: _items[index])));
                            },
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

Widget getSearchBarUI() {
  return Padding(
    padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 16, top: 8),
            child: Container(
              decoration: BoxDecoration(
                color: HotelAppTheme.buildLightTheme().backgroundColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(38.0),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: const Offset(0, 2),
                      blurRadius: 8.0),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 4, bottom: 4),
                child: TextField(
                  onChanged: (String txt) {},
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  cursorColor: HotelAppTheme.buildLightTheme().primaryColor,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Taper votre ville...',
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: HotelAppTheme.buildLightTheme().primaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(38.0),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  offset: const Offset(0, 2),
                  blurRadius: 8.0),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: const BorderRadius.all(
                Radius.circular(32.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(FontAwesomeIcons.search,
                    size: 20,
                    color: HotelAppTheme.buildLightTheme().backgroundColor),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
