import 'package:flutter/material.dart';
import 'package:coeliqueapplication/model/page.dart';

class PresentationScreen extends StatelessWidget {
  final Presentation store;
  const PresentationScreen(
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
                    "presentation de la maladie coeliaque",
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
                    "La maladie cœliaque ou « intolérance au gluten » est une maladie chronique de l’intestin grêle, entraînant une disparition progressive des villosités intestinales. Ces replis de la muqueuse recouvrant l’intestin permettent d’augmenter les surfaces d’absorption des nutriments (glucides, lipides, minéraux, vitamines, etc.). La maladie cœliaque se révèle le plus souvent dans l’enfance (entre 6 mois et 2 ans) et entre 20 et 40 ans.La maladie cœliaque est deux à trois fois plus fréquente chez la femme.Un malade cœliaque sur deux n’est pas observant du régime sans gluten, de façon volontaire ou non..",
                    style: TextStyle(
                      color: Colors.grey[225],
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 32),
                  child: Text(
                    "La maladie cœliaque est une maladie auto-immune déclenchée par le gluten, formé après hydratation, à partir des protéines végétales contenues dans beaucoup de céréales, comme le blé, l'orge, l‘épeautre, le seigle, le kamut et le triticale. Chez les enfants et les adultes, prédisposés génétiquement, l'absorption de produits alimentaires contenant du gluten, même si ce ne sont que des traces, entraîne une réaction immunitaire de l'intestin grêle. Celle-ci se traduit par une inflammation chronique des muqueuses de l’intestin grêle et une atrophie des cellules épithéliales. Ces modifications histologiques caractéristiques peuvent induire un syndrome de malabsorption. Dans le cadre d‘une alimentation strictement sans gluten, les conséquences sont toutefois complètement réversibles et les muqueuses de l'intestin grêle se régénèrent. Une alimentation à vie sans gluten, y compris sans traces de gluten, constitue à l’heure actuelle le seul traitement possible.",
                    style: TextStyle(
                      color: Colors.grey[225],
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
