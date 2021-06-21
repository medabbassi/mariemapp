import 'package:flutter/material.dart';
import 'package:coeliqueapplication/pages/home_page.dart';

class Doctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'SFProDisplay',
      ),
      home: HomePage(),
    );
  }
}
