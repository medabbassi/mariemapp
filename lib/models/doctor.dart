import 'package:meta/meta.dart';

class Doctor {
  final String firstName;
  final String ville;
  final String image;
  final String adresse;
  final double phone;

  Doctor({
    @required this.firstName,
    @required this.ville,
    @required this.image,
    @required this.adresse,
    @required this.phone,
  });
}
