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
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
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
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return _createMobileView();
            } else {
              return _createWebView();
            }
          },
        ),
      ),
    );
  }

  Widget _createWebView() {
    return Container(
        child: Padding(
            padding: EdgeInsets.only(
              left: 100.0,
              right: 100.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _createSearchView(), //Search view demo
                Text(
                  '$_query',
                ),
              ],
            )));
  }

  Widget _createMobileView() {
    return Container(
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _createSearchView(), //Search view demo
                Text(
                  '$_query',
                ),
              ],
            )));
  }

  Widget _createSearchView() {
    return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            prefixIcon: Icon(Icons.search),
            labelText: 'Enter IFSC code',
            isDense: true,
          ),
        ));
  }
}
