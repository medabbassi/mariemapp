import 'package:coeliqueapplication/cells/category_cell.dart';
import 'package:coeliqueapplication/cells/trd_cell.dart';
import 'package:coeliqueapplication/models/category.dart';
import 'package:coeliqueapplication/models/doctor.dart';
import 'package:coeliqueapplication/pages/detail_page.dart';
import 'package:coeliqueapplication/utils/custom_icons_icons.dart';
import 'package:coeliqueapplication/utils/he_color.dart';
import 'package:flutter/material.dart';
import 'hotel_app_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  List<Doctor> _trDoctors = List<Doctor>();

  get index => null;

  /// **********************************************
  /// ACTIONS
  /// **********************************************

  _onCellTap(Doctor doctor) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(doctor: doctor),
        ));
  }

  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  void initState() {
    super.initState();
    _trDoctors = _getTRDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("les Medecins"),
          backgroundColor: HexColor('#00C6AD'),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getSearchBarUI(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    _trDoctorsSection(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget getSearchBarUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
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

  /// **********************************************
  /// WIDGETS
  /// **********************************************

  /// Highlighted Doctors Section

  /// Top Rated Doctors Section
  Column _trDoctorsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Les medecins',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 22,
        ),
        ListView.separated(
          primary: false,
          shrinkWrap: true,
          itemCount: _trDoctors.length,
          separatorBuilder: (BuildContext context, int index) => Divider(
            thickness: 16,
            color: Colors.transparent,
          ),
          itemBuilder: (BuildContext context, int index) => TrdCell(
            doctor: _trDoctors[index],
            onTap: () => _onCellTap(_trDoctors[index]),
          ),
        ),
      ],
    );
  }

  /// **********************************************
  /// DUMMY DATA
  /// **********************************************

  /// Get Highlighted Doctors List

  /// Get Top Rated Doctors List
  List<Doctor> _getTRDoctors() {
    List<Doctor> trDoctors = List<Doctor>();

    trDoctors.add(Doctor(
      firstName: 'Azaiez Najoua',
      ville: 'Ben Arous',
      adresse: 'AV. DE L' 'ERE NVLLE, RESIDENCE LES EMERAUDES ENNASR I',
      phone: 71706647,
      image: 'albert.png',
    ));
    trDoctors.add(Doctor(
      firstName: 'Azaiez Najoua',
      ville: 'Ben Arous',
      adresse: 'AV. DE L' 'ERE NVLLE, RESIDENCE LES EMERAUDES ENNASR I',
      phone: 71706647,
      image: 'albert.png',
    ));
    trDoctors.add(Doctor(
      firstName: 'Azaiez Najoua',
      ville: 'Ben Arous',
      adresse: 'AV. DE L' 'ERE NVLLE, RESIDENCE LES EMERAUDES ENNASR I',
      phone: 71706647,
      image: 'albert.png',
    ));
    trDoctors.add(Doctor(
      firstName: 'Azaiez Najoua',
      ville: 'Ben Arous',
      adresse: 'AV. DE L' 'ERE NVLLE, RESIDENCE LES EMERAUDES ENNASR I',
      phone: 71706647,
      image: 'albert.png',
    ));
    trDoctors.add(Doctor(
      firstName: 'Azaiez Najoua',
      ville: 'Ben Arous',
      adresse: 'AV. DE L' 'ERE NVLLE, RESIDENCE LES EMERAUDES ENNASR I',
      phone: 71706647,
      image: 'albert.png',
    ));
    trDoctors.add(Doctor(
      firstName: 'Azaiez Najoua',
      ville: 'Ben Arous',
      adresse: 'AV. DE L' 'ERE NVLLE, RESIDENCE LES EMERAUDES ENNASR I',
      phone: 71706647,
      image: 'albert.png',
    ));
    trDoctors.add(Doctor(
      firstName: 'Azaiez Najoua',
      ville: 'Ben Arous',
      adresse: 'AV. DE L' 'ERE NVLLE, RESIDENCE LES EMERAUDES ENNASR I',
      phone: 71706647,
      image: 'albert.png',
    ));
    return trDoctors;
  }
}
