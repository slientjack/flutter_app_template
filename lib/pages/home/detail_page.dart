import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key key,
    @required this.name,
  }):super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {

    void _back() {
      Navigator.of(context).pop();
    }

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Detail Page'),
        actionsForegroundColor: Colors.black,
        padding: EdgeInsetsDirectional.only(start: 0),
        leading: CupertinoButton(child: Icon(Icons.arrow_back, color: Colors.black), padding: EdgeInsets.all(4), onPressed: _back,),
      ),
      child: Center(
        child: Container(
          width: 120,
          height: 120,
          color: Colors.blue,
          child: Text('Hello ' + name),
        ),
      ),
    );
  }
}