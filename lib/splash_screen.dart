import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      drawer: _buildDrawer(context),
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

    ListTile l1 = ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text('Oszczędności'),
      onTap: () {
        Navigator.pop(context);
      },
    );

    Text lol = Text('hehe');

    var children = [drawerHeader, l1, lol];
    ListView listView = ListView(padding: EdgeInsets.zero, children: children);

    return Drawer(
      child: listView,
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
