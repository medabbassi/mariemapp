import 'package:coeliqueapplication/models/doctor.dart';
import 'package:coeliqueapplication/utils/custom_icons_icons.dart';
import 'package:coeliqueapplication/utils/he_color.dart';
import 'package:flutter/material.dart';

class TrdCell extends StatelessWidget {
  final Doctor doctor;
  final Function onTap;

  const TrdCell({
    Key key,
    @required this.doctor,
    @required this.onTap,
  }) : super(key: key);

  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
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
          image: AssetImage('assets/images/' + doctor.image),
        ),
      ),
    );
  }

  /// Details Section
  Column _detailsSection() {
    return Column(
      children: [
        SizedBox(
          height: 5,
          width: 6,
        ),
        Text(
          doctor.firstName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 5,
          width: 6,
        ),
        Text(
          'Maladies ésotériques' + ' Specialist',
          style: TextStyle(
            color: HexColor('#929BB0'),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 2,
          width: 3,
        ),
      ],
    );
  }
}
