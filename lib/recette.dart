import 'dart:convert';

import 'package:coeliqueapplication/store/hotel_app_theme.dart';
import 'package:coeliqueapplication/widgetRecette/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'main.dart';
class Recette extends StatefulWidget{
  RecetteState createState() => RecetteState();
}
class RecetteState extends State<Recette>{
  List _items =[];
  List lof =[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["recipes"];

    });
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Recettes"),
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
                     child: GridView.builder(
                         gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                             maxCrossAxisExtent: 200,
                             childAspectRatio: .85,
                             crossAxisSpacing: 20,
                             mainAxisSpacing: 20),
                         itemCount: _items.length
                         ,
                         itemBuilder: (BuildContext ctx, index){
                           return Container(
                             alignment: Alignment.center,
                             child: CategoryCard(
                               title: _items[index]["name"],
                               type: _items[index]["recipeType"],
                               img: "assets/images/sable.jpg",
                               press: () async {
                                  print('card clicked');
                                  showGeneralDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      barrierLabel: MaterialLocalizations.of(context)
                                          .modalBarrierDismissLabel,
                                      barrierColor: Colors.black45,
                                      transitionDuration: const Duration(milliseconds: 200),
                                      pageBuilder: (BuildContext buildContext,
                                          Animation animation,
                                          Animation secondaryAnimation) {
                                        return Scaffold(
                                          body: CustomScrollView(
                                            slivers: <Widget>[
                                              SliverAppBar(
                                                backgroundColor: Colors.blue[100],
                                                expandedHeight: 300,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(40))),
                                                flexibleSpace: FlexibleSpaceBar(
                                                  background: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.vertical(bottom: Radius.circular(40)),
                                                    child: Image.asset(
                                                      'assets/images/chocolat.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SliverList(
                                                delegate: SliverChildListDelegate(
                                                  [
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    ListTile(
                                                      title: Text(
                                                        _items[index]["name"],
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w800,
                                                          fontSize: 20,
                                                          color: Colors.blueGrey[200],
                                                        ),
                                                      ),
                                                    ), ListTile(
                                                       title: Text(
                                                      "Type: "+_items[index]["recipeType"],
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w800,
                                                        fontSize: 20,
                                                        color: Colors.blueGrey,
                                                  ),
                                                ),
                                              ),
                                                    ListTile(
                                                      title: Text(
                                                        "Ingr??dients",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w800,
                                                          fontSize: 20,
                                                          color: Colors.blueGrey,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.only(left: 16, right: 16, bottom: 32),
                                                      child: Text(
                                                        _items[index]["ingredients"],
                                                        style: TextStyle(
                                                          color: Colors.grey[225],
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                    ListTile(
                                                      title: Text(
                                                        "Comment faire??:",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w800,
                                                          fontSize: 20,
                                                          color: Colors.blueGrey,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.only(left: 16, right: 16, bottom: 32),
                                                      child: Text(
                                                        _items[index]["method"],
                                                        style: TextStyle(
                                                          color: Colors.grey[225],
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      });

                               },
                             ),
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
                    onChanged: (String txt) {

                    },
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    cursorColor: HotelAppTheme.buildLightTheme().primaryColor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'search',
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
