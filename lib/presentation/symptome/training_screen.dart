import 'package:flutter/material.dart';
import 'package:coeliqueapplication/model/page.dart';

class TrainingScreen extends StatelessWidget {
  final TrainingScreen store;
  const TrainingScreen(
      {Key key, this.store, AnimationController animationController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                  'assets/images/userImage.png',
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
                    "Symptome",
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
                    "Les symptômes de la maladie cœliaque se manifestent par des diarrhées, une perte de poids, de la fatigue, des ballonnements, des maux de ventre, des nausées et, chez les enfants, par des troubles de la croissance. Dans quelques cas, des affections associées pouvant avoir un lien avec la maladie cœliaque apparaissent : anémie et carence en fer, ostéoporose, aménorrhée, carence en vitamines et en sels minéraux, dermatite herpétiforme de Dühring, troubles de la fertilité, intolérance au lactose. Les maladies auto-immunes, comme le diabète de  type 1, les maladies du foie et de la thyroïde peuvent être des signes d’une éventuelle maladie cœliaque.",
                    style: TextStyle(
                      color: Colors.grey[225],
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
