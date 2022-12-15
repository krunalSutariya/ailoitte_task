import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/string_constants.dart';
import '../models/drink_model.dart';
import '../providers/cocktail_provider.dart';
import '../screens/cocktail_detail_screen.dart';
import '../screens/home_screen.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: getRoute,
        title: StaticString.appName,
        theme: ThemeData(
          primarySwatch: Colors.purple,
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
            DrinksModel.fromJson(settings.arguments as Map<String, dynamic>);
        return MaterialPageRoute(
          builder: (context) {
            return CockTailDetailScreen(
              drinksModel: drinksModel,
            );
          },
        );
      case AppRouts.homeScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        );
      default:
        return null;
    }
  }
}
