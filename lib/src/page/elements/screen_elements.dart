import 'package:finansowa/src/route/page_root.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinAppDrawer extends StatelessWidget {
  final DrawerHeader _drawerHeader = DrawerHeader(
    margin: EdgeInsets.all(0),
    child: Text('Drawer Header'),
    decoration: BoxDecoration(color: Colors.blue),
  );

  final Widget _savingsSection =
      FinnAppDrawerSection("Oszczędności",
          Icons.monetization_on,
          Colors.amber);

  final Widget _investmentCalculator = FinAppDrawerElement(
      'Kalkulator lokaty', FinPageRoute.InvestmentCalculator);
  final Widget _somethingElse = FinAppDrawerElement(
      'Inny link', FinPageRoute.LifeFromInterest);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader,
          _savingsSection,
          _investmentCalculator,
          _somethingElse
        ],
      ),
    );
  }
}

class FinnAppDrawerSection extends StatelessWidget {
  final String _title;
  final IconData _iconData;
  final MaterialColor _color;

  FinnAppDrawerSection(this._title, this._iconData, this._color);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DecoratedBox(
        decoration: BoxDecoration(color: _color),
        child: ListTile(
          leading: Icon(_iconData),
          title: Text(_title),
        ),
      ),
    );
  }
}

class FinAppDrawerElement extends StatelessWidget {
  final String _title;
  final FinPageRoute _pageRoot;

  FinAppDrawerElement(this._title, this._pageRoot);

  @override
  Widget build(BuildContext context) {
    return ListTile (
      title: Text(_title),
      onTap: () {
        Navigator.pop(context);
        //TODO kilk powinien wywolać refresh w StatelessHomeScreen => HomePage z paremetrem _pageRoot
      },
    );
  }
}
