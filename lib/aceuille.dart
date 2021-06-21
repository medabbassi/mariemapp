import 'package:coeliqueapplication/Animations/Fadanimation.dart';
import 'package:flutter/material.dart';
import 'dart:ffi';
import 'package:page_transition/page_transition.dart';
import 'main.dart';
import 'presentation/presentation.dart';

void main() => runApp(MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    ));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController _scaleController;
  AnimationController _scale2Controller;
  AnimationController _widthController;
  AnimationController _positionController;

  Animation<double> _scaleAnimation;
  Animation<double> _scale2Animation;
  Animation<double> _widthAnimation;
  Animation<double> _positionAnimation;
  bool hideIcon = false;
  @override
  Void initState() {
    //todo:implement initState
    super.initState();

    _scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _widthController.forward();
            }
          });
    _widthController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _widthAnimation =
        Tween<double>(begin: 80.0, end: 300.0).animate(_widthController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _positionController.forward();
            }
          });
    _positionController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _positionAnimation =
        Tween<double>(begin: 0.0, end: 215.0).animate(_positionController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                hideIcon = true;
              });
              _scale2Controller.forward();
            }
          });

    _scale2Controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _scale2Animation =
        Tween<double>(begin: 1.0, end: 32.0).animate(_scale2Controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: Presentation()));
            }
          });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -60,
                left: 0,
                child: FadeAnimation(
                    1,
                    Container(
                      width: width,
                      height: 400,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/one1.png'),
                              fit: BoxFit.cover)),
                    )),
              ),
              Positioned(
                top: -100,
                left: 0,
                child: FadeAnimation(
                    1,
                    Container(
                      width: width,
                      height: 400,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/one1.png'),
                              fit: BoxFit.cover)),
                    )),
              ),
              Positioned(
                top: -130,
                left: 0,
                child: FadeAnimation(
                    1,
                    Container(
                      width: width,
                      height: 400,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/one1.png'),
                              fit: BoxFit.cover)),
                    )),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                        1,
                        Text(
                          "Coeliaque",
                          style: TextStyle(color: Colors.blue, fontSize: 40),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    FadeAnimation(
                        1.3,
                        Text(
                          "Coeliaque est une application mobile pour guider les maladie coelique est non coeliaque",
                          style: TextStyle(
                              color: Colors.black.withOpacity(.7), height: 1.4),
                        )),
                    SizedBox(
                      height: 180,
                    ),
                    FadeAnimation(
                        1.6,
                        AnimatedBuilder(
                            animation: _scaleController,
                            builder: (context, child) => Transform.scale(
                                  scale: _scaleAnimation.value,
                                  child: Center(
                                    child: AnimatedBuilder(
                                      animation: _widthController,
                                      builder: (context, child) => Container(
                                        width: _widthAnimation.value,
                                        height: 80,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: HexColor('#00C6AD')
                                                .withOpacity(.4)),
                                        child: InkWell(
                                          onTap: () {
                                            _scaleController.forward();
                                          },
                                          child: Stack(children: <Widget>[
                                            AnimatedBuilder(
                                              animation: _positionController,
                                              builder: (context, child) =>
                                                  Positioned(
                                                left: _positionAnimation.value,
                                                child: AnimatedBuilder(
                                                  animation: _scale2Controller,
                                                  builder: (context, child) =>
                                                      Transform.scale(
                                                    scale:
                                                        _scale2Animation.value,
                                                    child: Container(
                                                      width: 60,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: HexColor(
                                                              '#00C6AD')),
                                                      child: hideIcon == false
                                                          ? Icon(
                                                              Icons
                                                                  .arrow_forward,
                                                              color:
                                                                  Colors.white,
                                                            )
                                                          : Container(),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ),
                                ))),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
