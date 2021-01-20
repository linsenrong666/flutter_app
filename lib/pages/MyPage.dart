import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/net/HttpUtils.dart';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new MaterialButton(
          child: Text("连接Socket"),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            print("点击 start！！！！");
            var link = new longlink();
            link.main();
            print("点击 end！！！！");
          }),
    );
  }
}
