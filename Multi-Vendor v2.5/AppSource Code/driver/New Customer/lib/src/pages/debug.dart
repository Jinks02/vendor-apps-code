import 'package:flutter/material.dart';

import '../models/route_argument.dart';


// ignore: must_be_immutable
class DebugWidget extends StatefulWidget {
  RouteArgument routeArgument;

  DebugWidget({Key key, this.routeArgument}) : super(key: key);

  @override
  _DebugWidgetState createState() {
    return _DebugWidgetState();
  }
}

class _DebugWidgetState extends State<DebugWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Debug',
            style: Theme.of(context)
                .textTheme
                .headline6
                .merge(TextStyle(letterSpacing: 1.3)),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.my_location),
              onPressed: () {},
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Text('dd'));
  }
}
