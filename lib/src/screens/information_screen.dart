import 'package:finansowa/src/helper/Dog.dart';
import 'package:flutter/material.dart';
import 'package:finansowa/src/helper/DatabaseHelper.dart';


class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: SnackBarPage(),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  final DatabaseHelper db = new DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () async {
          List<Dog> dog = await db.dogs();
          final snackBar = SnackBar(
            content: Text(dog[0].name),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change!
              },
            ),
          );

          // Find the Scaffold in the Widget tree and use it to show a SnackBar!
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Text('Show SnackBar'),
      ),
    );
  }
}