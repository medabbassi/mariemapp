import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:coeliqueapplication/model/hotel_list_data.dart';
import 'package:coeliqueapplication/store/hotel_list_view.dart';
import 'package:coeliqueapplication/widgetRecette/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:coeliqueapplication/store/hotel_app_theme.dart';
import 'hotel_app_theme.dart';


class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}
class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}


class _StoreState extends State<Store> {
  TextEditingController editingController = TextEditingController();
  List _items = [];
  List searchData = [];
  //List<HotelListData> hotelList = HotelListData.hotelList;
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    readJson();

  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["stores"];
    }); }

  onSearchTextChanged(String text) async {
    searchData.clear();
    if (text.isEmpty) {
      setState(() {

      });
      return;
    }
    _items.forEach((data) {
      if (data['stores'].toString().toLowerCase().contains(text.toLowerCase().toString())) {
        searchData.add(data);
      }
    });
    setState(() {

    });
  }
    @override
    Widget build(BuildContext context) {
      var size = MediaQuery.of(context)
          .size;

      return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text("Les Magasin"),
          backgroundColor: HexColor('#00C6AD'),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              // Here the height of the container is 45% of our total height
              height: size.height * .45,
              decoration: BoxDecoration(
                color: Color.fromRGBO(220, 220, 220, 0),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: <Widget>[
                    getSearchBarUI(),
                    SizedBox(height: 10.0),
                    _items.length >0
                        ? Expanded(
                          child: ListView.builder(
                              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                              itemCount: _items.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  elevation: 10.0,
                                  child: Column(
                                    children: [
                                      Image.asset( 'assets/images/naturelle.png',
                                      height: 150.0,
                                      fit: BoxFit.fitWidth,),
                                      SizedBox(height: 5,),
                                     Padding(
                                         padding: EdgeInsets.all(5),
                                         child: Column(
                                             children: [
                                               Text(_items[index]["name"],
                                                 textAlign: TextAlign.left,
                                                 style: TextStyle(
                                                   fontWeight: FontWeight.bold,
                                                   fontSize: 24
                                                 ),
                                               ),
                                               SizedBox(height: 5,),

                                                   Text(_items[index]['address'] ?? "",
                                                     style:TextStyle(
                                                       color: Colors.grey
                                                     ) ,
                                                     textAlign: TextAlign.center,
                                                   ),
                                                   SizedBox(height: 5),
                                                   Icon(Icons.pin_drop,
                                                   color: HexColor('#00C6AD'),),
                                                    Text(_items[index]['governorate'] ?? "",
                                                      style:TextStyle(color: Colors.grey) ,),


                                               SizedBox(height: 10,),
                                            Text("N° tel: "+_items[index]["phone"]?? "",
                                           textAlign: TextAlign.left,
                                           style: TextStyle(
                                               fontWeight: FontWeight.bold,
                                               fontSize: 20
                                           ),
                                         ),
                                               SizedBox(height: 15,),
                                               IconButton(
                                                   onPressed: () =>
                                                   LaunchBrowser(_items[index]['facebook_link']),
                                                   icon: Icon(Icons.public))
                                             ],

                                       ),
                                     )

                                ])
                                );
                              })
                    ):Container()


                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  Widget getSearchBarUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
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
                    autofocus: true,
                    controller: editingController,
                    onTap: (){
                      print('search clicked');
                      showGeneralDialog(
                          context: context,
                          pageBuilder: (
                              BuildContext buildContext,
                              Animation animation,
                              Animation secondaryAnimation) {
                            return Scaffold(
                              body: Container(
                                  child: Column(
                                    children: [
                                     SizedBox(height: 10),
                                    Padding(padding: const EdgeInsets.only(left: 16, right: 16, top: 8,bottom: 4),
                                      child: TextField(
                                        controller: editingController,
                                        onChanged: (String text){
                                          text =text.toLowerCase();
                                          
                                        },
                                        cursorColor: HotelAppTheme.buildLightTheme().primaryColor,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Taper votre ville....',
                                        ),
                                      ),
                                    ),

                                      Expanded(
                                        child: searchData.length == 0
                                            ? ListView.builder(
                                          itemCount: _items.length,
                                          itemBuilder: (context, int index) {
                                              return Container(

                                              margin: EdgeInsets.all(10),
                                                child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [

                                                  Container(
                                                    height: 2,
                                                  ),
                                                  Text(_items[index]['governorate'],
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500
                                                  ),)
                                                ],
                                              ),
                                            );
                                          },
                                        )
                                            : ListView.builder(
                                          itemCount: searchData.length,
                                          itemBuilder: (context, int index) {
                                             return Container(

                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [

                                                  Container(
                                                    height: 2,
                                                  ),
                                                  Text(searchData[index]['Title'],
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold, fontSize: 16),)
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                              ),
                            );
                          } );
                    },
                    onChanged: onSearchTextChanged,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    cursorColor: HotelAppTheme.buildLightTheme().primaryColor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Taper votre ville....',
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
