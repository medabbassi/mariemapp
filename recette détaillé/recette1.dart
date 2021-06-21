import 'package:flutter/material.dart';

class Recette1 extends StatelessWidget {
  final Recette1 recette1;
  const Recette1({Key key, this.recette1}) : super(key: key);
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
                  'assets/images/chocolat.png',
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
                    " Gâteau mousse au chocolat sans gluten ",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Ingrédients",
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
                    "Pour un moule de 20 cm à bords amovibles: \n 30 g de farine sans gluten \n 100 g de chocolat noir \n 65 g de sucre \n 2 œufs	\n 75 g de beurre \n \n Pour la mousse au chocolat: \n 300 g de chocolat noir \n 75 g de beurre \n 400 ml de crème fraîche (équivaut à 3 boites de 15 cl) \n 3 œufs \n 2 cuillères à soupe de sucre glace",
                    style: TextStyle(
                      color: Colors.grey[225],
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Comment faire :",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 32),
                  child: Text(
                    "Pour le gâteau :\nChauffer le four à 160°C. \n Beurrer et fariner votre moule.\n Faire fondre le chocolat et le beurre au bain-marie \n	Battre un peu les œufs et le sucre y ajouter ensuite le chocolat fondu  puis ajouter ensuite la farine. \n	Verser la préparation dans un moule beurré et fariné, et enfourner 15-20 mn dans le four chaud. \n \nPour la mousse au chocolat: \n Faire fondre le chocolat et le beurre au bain-marie.\n Battre au fouet les œufs et le sucre jusqu’à ce que le mélange devienne un peu mousseux. (Une petite remarque personnellement je n'aime pas manger des oeufs crus dans des crèmes ou mousses donc pour éviter cette sensation je fait battre les oeufs sur un bain marie sans les faire cuire bien sûr, à vous de choisir) \n Verser la préparation au chocolat tiède dans la préparation aux œufs, et bien mélanger quelques secondes.\n Battre la crème en chantilly. Ne pas trop battre car sinon la crème formera du beurre intégrer délicatement au fur et à mesure la chantilly dans la préparation au chocolat, en mélangeant doucement de façon circulaire à l’aide d’une spatule.\n	Disposer de façon homogène la mousse sur le gâteau refroidi, et réfrigérer au moins 5 heures avant de découper.",
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
