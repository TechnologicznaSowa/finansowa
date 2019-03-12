import 'package:finansowa/src/page/elements/screen_elements.dart';
import 'package:finansowa/src/page/home_page.dart';
import 'package:flutter/material.dart';

class StatelessHomeScreen extends StatelessWidget {
  final Builder leading = Builder(
      builder: (context) => IconButton(
            icon: new Icon(Icons.list),
            color: Colors.amber,
            onPressed: () => Scaffold.of(context).openDrawer(),
          ));

  final Text title = Text(
    'FinanSowa',
    style: TextStyle(
        fontFamily: 'Pacifico',
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.bold),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: leading,
        title: title,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            color: Colors.amber,
            onPressed: ()=> _infoRoute(context),
          )
        ],
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      drawer: FinAppDrawer(),
      body: HomePage(),
      backgroundColor: Colors.white,

    );
  }

  _infoRoute(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondRoute()));
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
