import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/material.dart';

class TabDetailPage extends StatefulWidget {
  final String title;

  TabDetailPage(@QueryParam('title') this.title, {Key key}) : super(key: key);

  @override
  _TabDetailPageState createState() => _TabDetailPageState();
}

class _TabDetailPageState extends State<TabDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [Text("1234")],
        ),
      ),
    );
  }
}
