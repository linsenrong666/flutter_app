import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/layoutDemo.dart';
import 'package:flutter_app/navigator/tab_navigator.dart';
import 'package:flutter_app/testMain.dart';
import 'package:flutter_app/view.dart';

void main() => runApp(new DemoApp());

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Welcome to Android Flutter",
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
//      home: new RandomWords(),
      home: new TabNavigator(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Welcome to Android Flutter",
      theme: new ThemeData(primaryColor: Colors.white),
//      home: new RandomWords(),
      home: new MainPage(),
      routes: <String, WidgetBuilder>{
        "/rowLayout": (BuildContext context) => new RowLayout(),
      },
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 20.0);
  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Startup Name Generator",
          textAlign: TextAlign.center,
        ),
        actions: [
          new IconButton(
            icon: new Icon(Icons.list),
            onPressed: _pushSaved,
          ),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final tiles = _saved.map((pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      });
      final divided = ListTile.divideTiles(
        context: context,
        tiles: tiles,
      ).toList();
      return new TextPage();
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Saved"),
        ),
        body: new ListView(
          children: divided,
        ),
      );
    }));
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair wordPair) {
    final alreadySaved = _saved.contains(wordPair);

    return new ListTile(
      title: new Text(wordPair.asPascalCase, style: _biggerFont),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : Colors.amber,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(wordPair);
          } else {
            _saved.add(wordPair);
          }
        });
      },
    );
  }
}
