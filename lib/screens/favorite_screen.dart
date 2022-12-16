import 'package:ailoitte_task/models/drink_model.dart';
import 'package:ailoitte_task/providers/favorite_proivder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cards/cocktail_card.dart';
import '../constants/string_constants.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StaticString.favroiteItems),
      ),
      // Body...
      body: _buildBody(),
    );
  }

  // Body...
  Widget _buildBody() {
    return Consumer<FavoriteProvider>(
      builder: (context, favorite, child) => StreamBuilder<List<DrinksModel>>(
        stream: favorite.fetchFavoriteItemList(),
        builder: (context, snapshot) {
          if (snapshot.hasData && (snapshot.data?.isNotEmpty ?? false)) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 15),
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                DrinksModel? item = snapshot.data?[index];
                return item == null
                    ? const SizedBox.shrink()
                    : CocktailCard(
                        drinksModel: item,
                        onTap: () => cardOntapAction(item, context),
                      );
              },
            );
          } else {
            return const Center(child: Text(StaticString.noFavroiteItemFound));
          }
        },
      ),
    );
  }

//! --------------------------------Buttton Action----------------------------//

  //Card Ontap Action
  void cardOntapAction(DrinksModel drinksModel, BuildContext context) {
    Navigator.pushNamed(context, AppRouts.cocktailDetailScreen,
        arguments: {"drink": drinksModel.toJson(), "isFavroite": true});
  }
}
