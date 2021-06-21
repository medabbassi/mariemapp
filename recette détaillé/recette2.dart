import 'package:flutter/material.dart';

class Recette2 extends StatelessWidget {
  final Recette2 recette2;
  const Recette2({Key key, this.recette2}) : super(key: key);
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
                  'assets/images/bachkoutou.jpg',
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
                    " Biscuit tunisien sans gluten ",
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
                    '''
. 500g de farine sans gluten (j’ai fait avec Mix B de Sacher, parce que je n'ai que celle-là,) 
. 125g de sucre (j’ai trouvé qu'il n'est pas très sucré, si vous aimez le sucré, ajoutez un peu de sucre) (j’ai refait les biscuits et j'ai utilisé 200g de sucre au lieu de 125g...)
. 2 œufs
. 50 g de beurre fondue
. 1 levure chimique
du " aterchia " " Eau de Géranium) pour faire une pâte j'ai ajouté un peu plus de 100 ml.''',
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
                    '''- Comment faire:\n
Mélanger tous les ingrédients ajouter en fin '" aterchia " pour faire un pâte, utiliser la machine traditionnelle ( celle qu'on l'utilise pour la ghrayba)
Astuce: huilez la machine et vos mains, pour que la pâte ne colle pas..)
Enfournez à 170° pendant 20 mn''',
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
