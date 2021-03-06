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
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            getSearchBarUI(),
            SizedBox(height: 10.0),
            // Display the data loaded from sample.json
            _items.length > 0
                ? Expanded(

                  child: ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                   return GestureDetector(

                     onTap:() async {
                       print('tapped');
                       await showDialog(
                           barrierDismissible: false,
                           context: context,
                           builder: (BuildContext context){

                             return AlertDialog(
                               title: new Text("Dr_ "+ _items[index]['fullname'],
                               style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 20,
                                 fontFamily: 'assets/fonts/SFProDisplay-Bold.otf'
                               ),
                               maxLines: 1,
                               softWrap: false,
                               overflow: TextOverflow.ellipsis,),
                               content:  Card(
                                 child: Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 mainAxisSize: MainAxisSize.max,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: <Widget>[
                                 Image.asset("assets/images/cherly.png",
                                     fit: BoxFit.cover,
                                     height: 200,
                                     width: 200,
                                   ),
                                   SizedBox(height: 5),
                                    Text("Addresse: \n "+_items[index]['address'],
                                       style:TextStyle(
                                           fontSize: 22,
                                           fontWeight: FontWeight.w400
                                       )
                                   ),
                                   SizedBox(height: 5),
                                  Text(
                                       "Governorate: \n" +_items[index]['governorate'],style:TextStyle(
                                       fontSize: 22,
                                       fontWeight: FontWeight.w400
                                   )),
                                  SizedBox(height: 5),
                                   Text(
                                       "Specialit??: \n "+_items[index]['specialty'], style:TextStyle(
                                       fontSize: 22,
                                       fontWeight: FontWeight.w400
                                   )),
                                    SizedBox(height: 5),
                                    Text(
                                       "Numero de t??l??phone: \n"+_items[index]['phone']
                                       , style:TextStyle(
                                       fontSize: 22,
                                       fontWeight: FontWeight.w400
                                   )),
                                 ],
                               )
                               ) ,
                               actions: [
                                    TextButton(onPressed: (){
                                       Navigator.of(context).pop();
                                  },
                                        child:  Text ("Fermer"))
                               ],
                             );
                           });
                     } ,
                       child: Card(
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(10)
                         ),
                         elevation: 10.0,
                         margin: EdgeInsets.all(10),
                         child:Row(
                           children: <Widget>[
                             Padding(padding: EdgeInsets.only(left: 2),
                               child: Image.asset( 'assets/images/doctor1.jpg',
                                 height: 100.0,
                                 width: 100.0,
                                 fit: BoxFit.contain,),
                             ),
                             SizedBox(height: 5,),
                             Padding(
                               padding: EdgeInsets.only(left: 8,right: 1),
                               child: Column(
                                 children: [
                                   Text("Dr "+_items[index]["fullname"].toString()),
                                   Text("Specialit?? "+_items[index]["specialty"],),
                                   Text(_items[index]['governorate'])
                                 ],
                               ),
                             )
                           ],
                           //leading: Text(_items[index]["id"]),
                         ),
                       )
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
                  onChanged: (String txt) {

                  },
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
class d_info{
  final String fullname;
  final String governorate;
  final String specialty;
  final String phone;
  final String adresse;

  d_info(this.fullname, this.governorate, this.specialty, this.phone, this.adresse);
}