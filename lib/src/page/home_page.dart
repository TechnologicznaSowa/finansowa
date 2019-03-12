import 'package:finansowa/src/route/page_root.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {



  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FinPageRoute pageRoot = FinPageRoute.HomeScreen;

  @override
  Widget build(BuildContext context) {
    print('_HomePageState build');
    return  Center(
        child: Text(_textOfPageRoot(pageRoot)),
      );
  }

  String _textOfPageRoot(FinPageRoute pageRoot) {
    switch(pageRoot) {
      case FinPageRoute.HomeScreen:
        return 'HomeScreen';
      case FinPageRoute.InvestmentCalculator:
        return 'InvestmentCalculator';
      case FinPageRoute.LifeFromInterest:
        return 'LifeFromInterest';
      default:
        return '404';
    }
  }
}