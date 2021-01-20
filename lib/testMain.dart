import 'package:flutter/material.dart';
import 'package:flutter_app/layoutDemo.dart';
import 'package:flutter_app/view.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  var mContext;

  @override
  void initState() {
    super.initState();
    mContext = this.context;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("练习Demo"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return new Center(
        child: new ListView(
      children: [
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('column布局'),
          onPressed: () {
            Navigator.of(context)
                .push(new MaterialPageRoute(builder: (context) {
              return new ColumnLayout();
            }));
          },
        ),
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('row布局'),
          onPressed: () {
            Navigator.of(context).pushNamed("/rowLayout");
          },
        ),
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('返回传值'),
          onPressed: () {
            toPopActivity();
          },
        ),
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('线程'),
          onPressed: () {
            startActivity(new ThreadPage());
          },
        ),
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('手势检测'),
          onPressed: () {
            startActivity(new GesturePage());
          },
        ),
      ],
    ));
  }

  void toPopActivity() async {
    String result = await Navigator.of(context)
        .push(new MaterialPageRoute(builder: (context) => new PopActivity()));
    if (result != null) {
      print("popActivity:" + result);
    }
  }

  void startActivity(Widget widget) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
}
