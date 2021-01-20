import 'dart:io';
import 'dart:async';
import 'dart:convert' show utf8;
//https://blog.csdn.net/qq_38774121/article/details/104845501?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromBaidu-3.control&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromBaidu-3.control

class longlink {
  Socket socket;

  void main() async {
    var json = "{}";
    var host = "chat2.jd.com";
    var port = 443;
    await Socket.connect(host, port).then((Socket sock) {
      print('---------连接成功------------');
      socket = sock;
      socket.write(json + '\n');
      print('---------write ------------' + json);
      socket.listen(dataHandler,
          onError: errorHandler, onDone: doneHandler, cancelOnError: false);
    }).catchError((Object e) {
      print("socket无法连接: $e");
    });
    print('---------oooo------------');
  }

  void dataHandler(data) {
    print('-------Socket发送来的消息-------');
    print(new String.fromCharCodes(data).trim());
  }

  void errorHandler(error, StackTrace trace) {
    print("errorHandler" + error);
  }

  void doneHandler() {
    print('doneHandler');
    socket.destroy();
  }
}
