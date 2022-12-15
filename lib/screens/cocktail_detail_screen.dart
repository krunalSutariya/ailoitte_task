import 'package:ailoitte_task/widgets/cust_image.dart';
import 'package:ailoitte_task/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../constants/string_constants.dart';
import '../models/drink_model.dart';

class CockTailDetailScreen extends StatefulWidget {
  final DrinksModel? drinksModel;
  const CockTailDetailScreen({super.key, this.drinksModel});

  @override
  State<CockTailDetailScreen> createState() => _CockTailDetailScreenState();
}

class _CockTailDetailScreenState extends State<CockTailDetailScreen> {
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
    );
  }

  // Body
  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Image
            CustImage(
              cornerRadius: 20,
              imgURL: widget.drinksModel?.strDrinkThumb ?? "",
              height: 250,
              width: double.infinity,
              boxfit: BoxFit.fill,
            ),
            const SizedBox(height: 20),

            // Name Text
            CustomText(
              txtTitle: widget.drinksModel?.strGlass ?? "",
              style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.w600, color: Colors.grey.shade900),
            ),
            const SizedBox(height: 10),

            // Category text
            widget.drinksModel?.strCategory.isEmpty ?? false
                ? const SizedBox.shrink()
                : RichText(
                    text: TextSpan(
                      text: StaticString.category,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade900),
                      children: <TextSpan>[
                        TextSpan(
                          text: widget.drinksModel?.strCategory,
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
                        style: Theme.of(context).textTheme.headline6?.copyWith(
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
            widget.drinksModel?.strInstructions.isEmpty ?? false
                ? const SizedBox.shrink()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        txtTitle: StaticString.instruction,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade900),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: CustomText(
                            txtTitle: widget.drinksModel?.strInstructions,
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
            widget.drinksModel?.strInstructionsDE.isEmpty ?? false
                ? const SizedBox.shrink()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        txtTitle: StaticString.instructionsDE,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade900),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: CustomText(
                            txtTitle: widget.drinksModel?.strInstructionsDE,
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
            widget.drinksModel?.strInstructionsIT.isEmpty ?? false
                ? const SizedBox.shrink()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        txtTitle: StaticString.instructionsIt,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade900),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: CustomText(
                            txtTitle: widget.drinksModel?.strInstructionsIT,
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
    );
  }

  //!--------Getter method--------//

  // get Ingeredients
  String get getIngredients =>
      "${widget.drinksModel?.strIngredient1 ?? " "},${widget.drinksModel?.strIngredient2 ?? " "}${widget.drinksModel!.strIngredient3.isEmpty ? "" : ","}${widget.drinksModel?.strIngredient3 ?? " "}${widget.drinksModel!.strIngredient4.isEmpty ? "" : ","}${widget.drinksModel?.strIngredient4 ?? " "}";
}
