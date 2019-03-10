import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int state = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      drawer: _buildDrawer(context),
      body: _buildBody(),
      backgroundColor: Colors.white,
    );
  }

  _buildAppBar(BuildContext context) {
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

  _buildDrawer(BuildContext context) {
    DrawerHeader drawerHeader = DrawerHeader(
      child: Text('Drawer Header'),
      decoration: BoxDecoration(color: Colors.blue),
    );

    ListTile savings = ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text('Oszczędności'),
    );

    ListTile kalkulatorLokat = ListTile(
      title: Text('Kalkulator lokaty'),
      onTap: () {
        Navigator.pop(context);
        this.setState(() {
          state = 0;
        });
      },
    );

    ListTile kalkulatorLokat2 = ListTile(
      title: Text('cos innego'),
      onTap: () {
        Navigator.pop(context);
        this.setState(() {
          state = 1;
        });
      },
    );


    var children = [drawerHeader, savings, kalkulatorLokat, kalkulatorLokat2];
    ListView listView = ListView(padding: EdgeInsets.zero, children: children);

    return Drawer(
      child: listView,
    );
  }

  _buildBody() {
    switch(state){
      case 0:
        return Home('home');
      case 1:
        return Home('second');
    }
  }
}

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
