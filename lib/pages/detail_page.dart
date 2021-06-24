import 'package:coeliqueapplication/main.dart';
import 'package:coeliqueapplication/pages/homepage.dart';
import 'package:coeliqueapplication/utils/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:coeliqueapplication/models/doctor.dart';

class DetailPage extends StatefulWidget {


  const DetailPage({Key key}) : super(key: key);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List <d_info>_items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _titleSection(),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr.' + _items[index].fullname,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(
                        CustomIcons.pin_location,
                        size: 14,
                        color: HexColor('#C6C6CD'),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        widget.doctor.ville,
                        style: TextStyle(color: HexColor('#C6C6CD')),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      color: HexColor('#FFF9EA'),
                      border: Border.all(color: HexColor('#FFEDBE'), width: 1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(' Maladies ésotériques  ' + 'Specialist',
                        style: TextStyle(
                          color: HexColor('#FFBF11'),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text('Adresse: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      )),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    widget.doctor.adresse,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'N°télèphone : ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    widget.doctor.phone.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: HexColor('#00C6AD'),
      elevation: 0,
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: Colors.white),
      leading: IconButton(
        icon: Icon(CustomIcons.arrow_left, size: 20),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Container _titleSection() {
    return Container(
      height: 250,
      color: HexColor('#00C6AD'),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 207,
              height: 178,
              child: Image(
                filterQuality: FilterQuality.high,
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/images/bg_shape.png'),
              ),
            ),
          ),
          Positioned(
            right: 64,
            bottom: 15,
            child: SizedBox(
              height: 240,
              child: AspectRatio(
                aspectRatio: 196 / 285,
                child: Hero(
                  tag: widget.doctor.firstName,
                  child: Image(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fitHeight,
                      image:
                          AssetImage('assets/images/' + widget.doctor.image)),
                ),
              ),
            ),
          ),
          Positioned(
            right: 32,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          ),
        ],
      ),
    );
  }
}
