import 'package:ailoitte_task/providers/cocktail_provider.dart';
import 'package:ailoitte_task/providers/favorite_proivder.dart';
import 'package:ailoitte_task/widgets/cust_image.dart';
import 'package:ailoitte_task/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../constants/string_constants.dart';
import '../models/drink_model.dart';
import '../widgets/loading_indicator.dart';

class CockTailDetailScreen extends StatefulWidget {
  final DrinksModel? drinksModel;
  final bool isFromFavorite;
  const CockTailDetailScreen(
      {super.key, this.drinksModel, this.isFromFavorite = false});

  @override
  State<CockTailDetailScreen> createState() => _CockTailDetailScreenState();
}

class _CockTailDetailScreenState extends State<CockTailDetailScreen> {
  DrinksModel? _drinksModel;

  // Loading Indicator Notifier
  final LoadingIndicatorNotifier _loadingIndicatorNotifier =
      LoadingIndicatorNotifier();

  @override
  void initState() {
    _drinksModel = widget.drinksModel;
    fetchDrinkDetail();
    super.initState();
  }

  //!-------------------------------UI-----------------------------//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  // Appbar
  AppBar _buildAppbar() {
    return AppBar(
      title: const Text(StaticString.cocktailListDetail),
      actions: [
        Consumer<FavoriteProvider>(
          builder: (context, favroite, child) => IconButton(
            onPressed: () => favroite.favroiteOnTapAction(_drinksModel),
            icon: Icon(favroite.isFavroite(_drinksModel)
                ? Icons.favorite
                : Icons.favorite_border),
          ),
        )
      ],
    );
  }

  // Body
  Widget _buildBody() {
    return LoadingIndicator(
      loadingStatusNotifier: _loadingIndicatorNotifier,
      child: Consumer<CocktailProvider>(
        builder: (context, coktail, child) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Image
                CustImage(
                  cornerRadius: 20,
                  imgURL: _drinksModel?.strDrinkThumb ?? "",
                  height: 250,
                  width: double.infinity,
                  boxfit: BoxFit.fill,
                ),
                const SizedBox(height: 20),

                // Name Text
                CustomText(
                  txtTitle: _drinksModel?.strGlass ?? "",
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.grey.shade900),
                ),
                const SizedBox(height: 10),

                // Category text
                _drinksModel?.strCategory.isEmpty ?? false
                    ? const SizedBox.shrink()
                    : RichText(
                        text: TextSpan(
                          text: StaticString.category,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade900),
                          children: <TextSpan>[
                            TextSpan(
                              text: _drinksModel?.strCategory,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                const SizedBox(height: 10),

                // Ingredients text
                getIngredients.isEmpty
                    ? const SizedBox.shrink()
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            txtTitle: StaticString.ingredient,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade900),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: CustomText(
                                txtTitle: getIngredients,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                const SizedBox(height: 10),

                // Instruction text
                _drinksModel?.strInstructions.isEmpty ?? false
                    ? const SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            txtTitle: StaticString.instruction,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade900),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: CustomText(
                                txtTitle: _drinksModel?.strInstructions,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                const SizedBox(height: 10),

                // InstructionDE text
                _drinksModel?.strInstructionsDE.isEmpty ?? false
                    ? const SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            txtTitle: StaticString.instructionsDE,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade900),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: CustomText(
                                txtTitle: _drinksModel?.strInstructionsDE,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),

                const SizedBox(height: 10),

                // InstructionIT text
                _drinksModel?.strInstructionsIT.isEmpty ?? false
                    ? const SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            txtTitle: StaticString.instructionsIt,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade900),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: CustomText(
                                txtTitle: _drinksModel?.strInstructionsIT,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //!--------Getter method--------//

  // Get ingeredients...
  String get getIngredients =>
      "${_drinksModel?.strIngredient1 ?? " "},${_drinksModel?.strIngredient2 ?? " "}${_drinksModel!.strIngredient3.isEmpty ? "" : ","}${_drinksModel?.strIngredient3 ?? " "}${_drinksModel!.strIngredient4.isEmpty ? "" : ","}${_drinksModel?.strIngredient4 ?? " "}";

//! ---------------------------------Helper function----------------------------//

  // Fetch drink item detail...
  Future<void> fetchDrinkDetail() async {
    try {
      if (!widget.isFromFavorite) {
        return;
      }
      _loadingIndicatorNotifier.show(
          loadingIndicatorType: LoadingIndicatorType.spinner);
      _drinksModel = await Provider.of<CocktailProvider>(context, listen: false)
          .fetchDrinksDetail(_drinksModel);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      _loadingIndicatorNotifier.hide();
    }
  }
}
