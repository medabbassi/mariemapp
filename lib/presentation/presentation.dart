import 'package:coeliqueapplication/presentation/models/tabIcon_data.dart';
import 'package:coeliqueapplication/presentation/pointFort/pointfort.dart';
import 'package:coeliqueapplication/presentation/symptome/training_screen.dart';
import 'package:flutter/material.dart';
import 'bottom/bottom_bar_view.dart';
import 'diagnostique/diagnostique.dart';
import 'fintness_app_theme.dart';
import 'definition/my_diary_screen.dart';

class Presentation extends StatefulWidget {
  @override
  _PresentationScreenState createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<Presentation>
    with TickerProviderStateMixin {
  AnimationController animationController;
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: FitnessAppTheme.background,
  );

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = PresentationScreen(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
            tabIconsList: tabIconsList,
            addClick: () {},
            changeIndex: (int index) {
              if (index == 0) {
                animationController.reverse().then<dynamic>((data) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    tabBody = PresentationScreen(
                        animationController: animationController);
                  });
                });
              } else if (index == 1) {
                animationController.reverse().then<dynamic>((data) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    tabBody = TrainingScreen(
                        animationController: animationController);
                  });
                });
              } else if (index == 2) {
                animationController.reverse().then<dynamic>((data) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    tabBody = DiagnosticScreen(
                        animationController: animationController);
                  });
                });
              } else if (index == 3) {
                animationController.reverse().then<dynamic>((data) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    tabBody = PointFortScreen(
                        animationController: animationController);
                  });
                });
              }
            }),
      ],
    );
  }
}
