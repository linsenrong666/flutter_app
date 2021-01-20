import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ColumnLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Column布局"),
      ),
      body: new Column(
        children: [
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
            child: Column(
              children: [new Text("data")],
            ),
          ),
          Container(
            color: Colors.blue,
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.green,
            width: 100,
            height: 100,
          ),
        ],
      ),
    );
  }
}

class RowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Row布局"),
      ),
      body: new Row(
        children: [
          Container(
            color: Colors.red,
            width: 300,
            height: 100,
            child: Column(
              children: [new Text("data")],
            ),
          ),
          Container(
            color: Colors.blue,
            width: 300,
            height: 100,
          ),
          Container(
            color: Colors.green,
            width: 300,
            height: 100,
          ),
        ],
      ),
    );
  }
}

class PopActivity extends StatelessWidget {
  final textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("返回传值"),
      ),
      body: new Column(
        children: [
          new TextField(
            controller: textController,
          ),
          new MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('点击返回'),
              onPressed: () {
                String text = textController.text;
                Navigator.of(context).pop(text);
              })
        ],
      ),
    );
  }
}

class ThreadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("线程"),
      ),
      body: new ThreadPageWidget(),
    );
  }
}

class ThreadPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ThreadPageState();
  }
}

class ThreadPageState extends State<ThreadPageWidget> {
  List widgets = [];

  final text = new Text(
    "init",
    style: new TextStyle(
      color: Colors.blue,
      fontSize: 30,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new Padding(
          padding: const EdgeInsets.all(16.0),
          child: text,
        ),
        new MaterialButton(
          child: new Text("启动线程"),
          minWidth: double.infinity,
          color: Colors.green,
          height: 50,
          onPressed: _onClick,
        ),
        getBody(),
      ],
    );
  }

  Widget getBody() {
    if (widgets.length == 0) {
      return getProgressBar();
    } else {
      return new Expanded(
        child: new ListView.builder(
            itemCount: widgets.length,
            itemBuilder: (context, i) {
              return getRow(i);
            }),
      );
    }
  }

  Widget getProgressBar() {
    return Expanded(
      child: new Center(child: new CircularProgressIndicator()),
    );
  }

  Widget getRow(int i) {
    return new Padding(
      padding: new EdgeInsets.all(10.0),
      child: new Text("Row ${widgets[i]["title"]}"),
    );
  }

  void _onClick() {
    request();
  }

  void request() async {
    print("request");
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = json.decode(response.body);
    });
  }
}

class GesturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("手势检测"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() => new GesturePageWidget();
}

class GesturePageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new GesturePageState();
  }
}

class GesturePageState extends State<GesturePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: FlutterLogo(
          size: 200,
        ),
        onTap: () {
          print("onTaponTaponTaponTaponTap");
        },
        onLongPress: () {
          print("onLongPressonLongPressonLongPressonLongPress");
        },
      ),
    );
  }
}
