import 'package:ailoitte_task/providers/favorite_proivder.dart';
import 'package:ailoitte_task/screens/bottom_navigation_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/string_constants.dart';
import '../models/drink_model.dart';
import '../providers/cocktail_provider.dart';
import '../screens/cocktail_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CocktailProvider>.value(
            value: CocktailProvider()),
        ChangeNotifierProvider<FavoriteProvider>.value(
            value: FavoriteProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: getRoute,
        title: StaticString.appName,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        initialRoute: AppRouts.homeScreenRoute,
      ),
    );
  }

  // Get OnGenerate Routes
  Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouts.cocktailDetailScreen:
        DrinksModel drinksModel =
            DrinksModel.fromJson((settings.arguments as Map<String, dynamic>)['drink']);
        bool isFromFavorite = (settings.arguments as Map<String, dynamic>)['isFavroite'];
        return MaterialPageRoute(
          builder: (context) {
            return CockTailDetailScreen(
              drinksModel: drinksModel,
              isFromFavorite: isFromFavorite,
            );
          },
        );
      case AppRouts.homeScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const BottomNavigationBarScreen();
          },
        );
      default:
        return null;
    }
  }
}
