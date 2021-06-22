import 'package:flutter/material.dart';
import 'package:coeliqueapplication/model/page.dart';

class PointFortScreen extends StatelessWidget {
  final PointFortScreen store;
  const PointFortScreen(
      {Key key, this.store, AnimationController animationController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var child;
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
                  'assets/images/mathew.png',
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
                  "Les 5 Point Fort ",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                child: Text(
                  " 1/ 	La maladie cœliaque est une maladie systémique fréquente (0,2 à 3 %) touchant tous les âges de la vie.",
                  style: TextStyle(
                    color: Colors.grey[225],
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(),
              ListTile(
                title: Text(
                  "2/ La maladie peut être latente, avec présence d’anticorps mais sans atrophie villositaire intestinale, pendant de nombreuses années avant de passer éventuellement au stade de maladie active, silencieuse (atrophie villositaire et séropositivité sans signes clinico-biologiques) ou symptomatique.",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(),
              ListTile(
                title: Text(
                  "3/ La forme classique se manifestant par une diarrhée chronique avec dénutrition reste relativement rare chez l’enfant, à coté des formes frustes ou atypiques, qui sont plus fréquentes et souvent méconnues.",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(),
              ListTile(
                title: Text(
                  "4/	Le régime sans gluten ne doit pas être débuté sans certitude diagnostique. Il doit être indiqué par un médecin spécialisé en gastroentérologie. Le régime sans gluten est indiqué devant toute maladie cœliaque symptomatique, typique ou atypique",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
