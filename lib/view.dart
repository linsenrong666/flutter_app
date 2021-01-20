import 'package:flutter/material.dart';

class TextPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TextPageState();
  }
}

class TextPageState extends State<TextPage> {
  String textToShow = "I like Flutter";

  void _updateText() {
    setState(() {
      // update the text
      textToShow = "Flutter is Awesome!";
    });
  }

  bool toggle = true;

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  Widget _getChildView() {
    if (toggle) {
      return new Text(textToShow);
    } else {
      return new MaterialButton(
        onPressed: _toggle,
        child: new Text("toggle two"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sample App"),
      ),
      body: new Center(
        child: _getChildView(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: new Icon(Icons.update),
      ),
    );
  }
}
