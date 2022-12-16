import 'package:ailoitte_task/constants/string_constants.dart';
import 'package:ailoitte_task/screens/favorite_screen.dart';
import 'package:ailoitte_task/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../providers/favorite_proivder.dart';
import '../widgets/loading_indicator.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  // Loading Indicator Notifier
  final LoadingIndicatorNotifier _loadingIndicatorNotifier =
      LoadingIndicatorNotifier();

  // Widegts...
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    FavoriteScreen()
  ];

  // Value notifer...
  final ValueNotifier<int> _valueNotifier = ValueNotifier(0);

  @override
  void initState() {
    openBox();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _valueNotifier,
      builder: (context, selectedIndex, child) => Scaffold(
        body: LoadingIndicator(
          loadingStatusNotifier: _loadingIndicatorNotifier,
          child: IndexedStack(
            index: selectedIndex,
            children: _widgetOptions,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: StaticString.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: StaticString.favorite,
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (index) {
            _valueNotifier.value = index;
            _valueNotifier.notifyListeners();
          },
        ),
      ),
    );
  }

  //! ---------------------------------Helper function----------------------------//

  Future<void> openBox() async {
    try {
      _loadingIndicatorNotifier.show(
          loadingIndicatorType: LoadingIndicatorType.spinner);
      await Provider.of<FavoriteProvider>(context, listen: false).openBox();
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      _loadingIndicatorNotifier.hide();
    }
  }
}
