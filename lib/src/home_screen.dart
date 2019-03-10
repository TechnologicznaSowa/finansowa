import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _PageRoot pageRoot = _PageRoot.HomeScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: _buildBody(),
      backgroundColor: Colors.white,
    );
  }

  _buildAppBar() {
    Builder leading = Builder(
        builder: (context) => IconButton(
              icon: new Icon(Icons.list),
              color: Colors.amber,
              onPressed: () => Scaffold.of(context).openDrawer(),
            ));

    Text title = Text(
      'FinanSowa',
      style: TextStyle(
          fontFamily: 'Pacifico',
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold),
    );

    var actions = <Widget>[
      IconButton(
        icon: Icon(Icons.info_outline),
        color: Colors.amber,
        onPressed: () => _push(context),
      )
    ];

    return AppBar(
      leading: leading,
      title: title,
      actions: actions,
      elevation: 0.0,
      backgroundColor: Colors.white,
    );
  }

  _push(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondRoute()),
    );
  }

  _buildDrawer() {
    DrawerHeader drawerHeader = DrawerHeader(
      margin: EdgeInsets.all(0),
      child: Text('Drawer Header'),
      decoration: BoxDecoration(color: Colors.blue),
    );

    ListTile savings = ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(
        'Oszczędności',
      ),
    );
    Container savingsSection = Container(
      child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.amber), child: savings),
    );
    ListTile investmentCalculator =
        _buildSectionItem('Kalkulator lokaty', _PageRoot.InvestmentCalculator);
    ListTile lifeFromInterest =
        _buildSectionItem('Życie z odsetek', _PageRoot.LifeFromInterest);
    ListTile returnFromInvestment = _buildSectionItem(
        'Stopa zwrotu z inwestycji', _PageRoot.LifeFromInterest);
    ListTile investFund = _buildSectionItem(
        'Fundusz inwestycyjny', _PageRoot.LifeFromInterest);
    ListTile delayingInvestment = _buildSectionItem(
        'Koszt zwlekania z inwestycją', _PageRoot.LifeFromInterest);

    ListTile credit = ListTile(
      leading: Icon(Icons.account_balance),
      title: Text(
        'Kredyt',
      ),
    );
    Container creditSection = Container(
      child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.redAccent), child: credit),
    );
    ListTile creditCalculator =
    _buildSectionItem('Kalkulator kredytu', _PageRoot.InvestmentCalculator);

    List<Widget> children = [
      drawerHeader,
      savingsSection,
      investmentCalculator,
      lifeFromInterest,
      returnFromInvestment,
      investFund,
      delayingInvestment,
      creditSection,
      creditCalculator
    ];
    ListView listView = ListView(padding: EdgeInsets.zero, children: children);

    return Drawer(
      child: listView,
    );
  }

  _buildSectionItem(String text, _PageRoot pageRoot) {
    return ListTile(
      title: Text(text),
      onTap: () {
        Navigator.pop(context);
        this.setState(() {
          this.pageRoot = pageRoot;
        });
      },
    );
  }

  _buildBody() {
    switch (pageRoot) {
      case _PageRoot.HomeScreen:
        return Home('home');
      case _PageRoot.InvestmentCalculator:
        return Home('second');
      default:
        return Home('404');
    }
  }
}

enum _PageRoot { HomeScreen, InvestmentCalculator, LifeFromInterest }

class Home extends StatelessWidget {
  final String text;

  Home(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!X'),
        ),
      ),
    );
  }
}
