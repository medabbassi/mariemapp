import 'package:flutter/material.dart';
import 'package:coeliqueapplication/model/page.dart';

class DiagnosticScreen extends StatelessWidget {
  final DiagnosticScreen store;
  const DiagnosticScreen(
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
                  "Diagnostic",
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
                  "Le diagnostic de la maladie cœliaque passe par quatre étapes. En tout premier lieu, une anamnèse répertoriant la présence des troubles, suivie d’analyses sérologiques et histologiques. Et, en tout dernier lieu, une période d’alimentation sans gluten qui viendra confirmer le diagnostic.",
                  style: TextStyle(
                    color: Colors.grey[225],
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(),
              ListTile(
                title: Text(
                  "Pour le diagnostic => Examen physique, détermination, conseils et formation sur la maladie cœliaque, conseils nutritionnels, dépistage recommandé pour les membres de la famille (DQ2, DQ8 et sérologie), recommandation de l'association des patients atteints de maladie cœliaque, examens de routine (numération globulaire, fer, folates, vitamine B12, valeurs de la fonction des glandes de culpabilité, enzymes hépatiques, calcium, phosphates, vitamine D",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              ListTile(
                title: Text(
                  "Après 3 à 4 mois => Évaluation des symptômes et de la progression Évaluation de la sérologie nutritionnelle (IgA-TG2)",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              ListTile(
                title: Text(
                  "Après 6 mois => Évaluation des symptômes Évaluation de la nutrition Sérologie Répéter les examens de routine (s'il y avait auparavant des valeurs anormales)",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              ListTile(
                title: Text(
                  "Après 1 an => Évaluation des symptômes Évaluation clinique Évaluation de la nutrition Sérologie Répétition des examens de routine",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              ListTile(
                title: Text(
                  "Après 2 ans => Évaluation des symptômes Évaluation du régime alimentaire (si nécessaire) Sérologie Examen de la fonction thyroïdienne Autres examens basés sur une évaluation clinique",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              ListTile(
                title: Text(
                  "Après 3 ans => Densitomètre osseuse (si les valeurs précédentes étaient anormales) Évaluation des symptômes Évaluation de la nutrition Sérologie Examen de la fonction thyroïdienne Autres examens basés sur une évaluation clinique",
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
