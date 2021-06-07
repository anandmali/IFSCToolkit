import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _query = ""; //Holder for search text

  final _searchViewController = TextEditingController();

  void _performSearch() {
    _searchViewController.addListener(() {
      setState(() {
        if (_searchViewController.text.isEmpty) {
          _query = "Nothing to search";
        } else {
          _query = _searchViewController.text;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    _searchViewController.addListener(_performSearch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _createSearchView(), //Search view demo
            Text(
              '$_query',
            ),
          ],
        ),
      ),
    );
  }

  Widget _createSearchView() {
    return new Container(
      child: new TextField(
        controller: _searchViewController,
        decoration: InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(35.0),
            ),
          ),
          hintText: "Search",
          hintStyle: new TextStyle(color: Colors.orange),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
