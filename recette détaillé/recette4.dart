import 'package:flutter/material.dart';

class Recette4 extends StatelessWidget {
  final Recette4 recette4;
  const Recette4({Key key, this.recette4}) : super(key: key);
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
                  'assets/images/sable.jpg',
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
                    " Sablés Sans Gluten ",
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
⦁	- La pâte:\n
- Mélangez la farine de mais, farine de riz avec le beurre fondu, ajoutez l'eau de géranium petit à petit jusqu'à avoir une pâte homogène, réservez.

    2.La pâte à dattes:\n
- Prenez des dattes fraîches , éliminez le noyau et hachez finement dans un robot ou à la main.
- Ajoutez la camelle, et petit à petit  malaxez avec des mains huilés jusqu'à avoir aussi une pâte homogène.

   3.Le sirop.
-Préparez le sirop avec ses ingrédients , sur un feu moyen .
 
    3.Procédure:\n
- Prenez votre pâte de makrouth, formez des boudins et mettez votre pâte à datte, comme suit dans ces photos dans ce lien
- Si vous disposez de l'appareil pour décorez les makrouth,déposez là sur votre pâte et appuyez légèrement, puis coupez les formes habituels du makrouth.
- Chauffez l'huile ( pas trop pour que votre makrouth ne prend pas vite la couleur brune ..); déposez vos makrouth dans l'huile, puis directement dans le sirop
''',
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
