import 'package:ailoitte_task/cards/cocktail_card.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../constants/string_constants.dart';
import '../providers/cocktail_provider.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/no_content_label.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //!----------------------------Variables--------------------------//

  // Landlord Provider getter;
  CocktailProvider get getCocktailProvider =>
      Provider.of<CocktailProvider>(context, listen: false);

  // Search Controller
  final TextEditingController _searchController = TextEditingController();

  // Loading Indicator Notifier
  final LoadingIndicatorNotifier _loadingIndicatorNotifier =
      LoadingIndicatorNotifier();

  @override
  void initState() {
    fetchCocktailList();
    super.initState();
  }

  //!-------------------------------UI-----------------------------//
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: keyboardHideOntap,
      child: Scaffold(
        appBar: _buildAppbar(),
        body: _buildBody(),
      ),
    );
  }


  // Appbar
  AppBar _buildAppbar() {
    return AppBar(
      title: const Text(StaticString.cocktailList),
    );
  }

  // Body
  Widget _buildBody() {
    return LoadingIndicator(
      loadingStatusNotifier: _loadingIndicatorNotifier,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Search cocktail textfield
            _buildSearchCocktailTextfield(),
            // Cooktail Search List
            _buildCocktailList()
          ],
        ),
      ),
    );
  }

  // Search Loaction Textfield
  Widget _buildSearchCocktailTextfield() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: _searchController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: StaticString.search,
            suffixIcon: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                _searchController.clear();
                getCocktailProvider.fetchDrinksData();
              },
            )),
        onChanged: (value) {
          getCocktailProvider.fetchDrinksData(search: value);
        },
      ),
    );
  }

  // Cocktail List View
  Widget _buildCocktailList() {
    return Consumer<CocktailProvider>(
        builder: (context, cocktailProvider, child) {
      return cocktailProvider.cocktailList.isEmpty
          ? NoContentLabel(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.3),
              title: StaticString.noDataFound,
              onPress: fetchCocktailList,
            )
          : Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemCount: cocktailProvider.cocktailList.length,
                itemBuilder: (context, index) {
                  return CocktailCard(
                    drinksModel: cocktailProvider.cocktailList[index],
                  );
                },
              ),
            );
    });
  }

  //! --------------------------------Buttton Action----------------------------//

  // Keyboard Hide on tap
  void keyboardHideOntap() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  //! ---------------------------------Helper function----------------------------//

  // Fetch cocktail list...
  Future<void> fetchCocktailList({
    String search = "",
    LoadingIndicatorType? loadingIndicatorType = LoadingIndicatorType.spinner,
  }) async {
    try {
      _loadingIndicatorNotifier.show(
        loadingIndicatorType: loadingIndicatorType,
      );
      await getCocktailProvider.fetchDrinksData(search: search);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      _loadingIndicatorNotifier.hide();
    }
  }
}
