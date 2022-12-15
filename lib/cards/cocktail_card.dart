import 'package:flutter/material.dart';

import '../constants/string_constants.dart';
import '../models/drink_model.dart';
import '../widgets/cust_image.dart';
import '../widgets/custom_text.dart';

class CocktailCard extends StatelessWidget {
  final DrinksModel drinksModel;
  const CocktailCard({super.key, required this.drinksModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => cardOntapAction(context),
      leading: CustImage(
        cornerRadius: 10,
        imgURL: drinksModel.strDrinkThumb,
        height: 60,
        width: 60,
      ),
      title: CustomText(
        txtTitle: drinksModel.strDrink,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
            fontWeight: FontWeight.w600, color: Colors.grey.shade900),
      ),
      subtitle: CustomText(
        txtTitle: "${StaticString.category} ${drinksModel.strCategory}",
        style: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(fontWeight: FontWeight.w500, color: Colors.grey),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 20,
        color: Colors.grey,
      ),
    );
  }

  //!----------------------------Button action------------------------//

  //Card Ontap Action
  void cardOntapAction(BuildContext context) {
    Navigator.pushNamed(context, AppRouts.cocktailDetailScreen,
        arguments: drinksModel.toJson());
  }
}
