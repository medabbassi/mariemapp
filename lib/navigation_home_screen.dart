import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'user.dart';
import 'home.dart';
import 'doctor.dart';
import 'recette.dart';
import 'store/store.dart';
import 'aceuille.dart';
import 'presentation/presentation.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = MyHomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.Presentation) {
        setState(() {
          screenView = Presentation();
        });
      } else if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = MyHomePage();
        });
      } else if (drawerIndex == DrawerIndex.Doctor) {
        setState(() {
          screenView = Doctor();
        });
      } else if (drawerIndex == DrawerIndex.Recette) {
        setState(() {
          screenView = Recette();
        });
      } else if (drawerIndex == DrawerIndex.Store) {
        setState(() {
          screenView = Store();
        });
      }
    }
  }
}
