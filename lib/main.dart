import 'package:flutter/material.dart';

void main() {
  runApp(MyAppDemo());
}

class MyAppDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Styling Demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  @override
  Widget build(BuildContext context) {
    // return new Container(
    //   padding: new EdgeInsets.only(left: 0.0, bottom: 8.0, right: 16.0),
    //   decoration: new BoxDecoration(color: Colors.blue),
    //   child: new Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Text(
    //         '0.00',
    //         style: TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),
    //       ),
    //       Text(
    //         'Current Balance',
    //         style: TextStyle(color: Colors.white, fontSize: 26.0, fontWeight: FontWeight.bold),
    //       ),
    //       new Card(
    //         child: new Column(
    //           children: <Widget>[
    //             new Padding(
    //                 padding: new EdgeInsets.all(7.0),
    //                 child: new Row(
    //                   children: <Widget>[
    //                     new Padding(
    //                       padding: new EdgeInsets.all(7.0),
    //                       child: new Icon(Icons.thumb_up),
    //                     ),
    //                     new Padding(
    //                       padding: new EdgeInsets.all(7.0),
    //                       child: new Text(
    //                         'Like',
    //                         style: new TextStyle(fontSize: 18.0),
    //                       ),
    //                     ),
    //                     new Padding(
    //                       padding: new EdgeInsets.all(7.0),
    //                       child: new Icon(Icons.comment),
    //                     ),
    //                     new Padding(
    //                       padding: new EdgeInsets.all(7.0),
    //                       child: new Text('Comments', style: new TextStyle(fontSize: 18.0)),
    //                     )
    //                   ],
    //                 ))
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your username',
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(15.0)),
                // elevation: 10,
                decoration: BoxDecoration(
                  color: Colors.tealAccent,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),


                  // child: TextFormField(
                  //   cursorColor: Colors.black,
                  //   decoration: new InputDecoration(
                  //       border: InputBorder.none,
                  //       focusedBorder: InputBorder.none,
                  //       enabledBorder: InputBorder.none,
                  //       errorBorder: InputBorder.none,
                  //       disabledBorder: InputBorder.none,
                  //       contentPadding: EdgeInsets.only(
                  //           left: 15, bottom: 11, top: 11, right: 15),
                  //       hintText: "Hint here"),
                  // )

                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      // border: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(20.0)),
                      hintText: 'Even Densed TextFiled',
                      isDense: true, // Added this
                      // contentPadding: EdgeInsets.all(8),  // Added this
                    ),
                  ),
                )))
      ],
    );
  }
}

class FirstFragment extends StatelessWidget {
  _getSizes() {}

  _getPositions() {}

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.only(left: 0.0, bottom: 8.0, right: 16.0),
      decoration: new BoxDecoration(color: Colors.blue),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '0.00',
            style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Current Balance',
            style: TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.bold),
          ),
          new Card(
            child: new Column(
              children: <Widget>[
                new Image.network(
                    'https://i.ytimg.com/vi/fq4N0hgOWzU/maxresdefault.jpg'),
                new Padding(
                    padding: new EdgeInsets.all(7.0),
                    child: new Row(
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.all(7.0),
                          child: new Icon(Icons.thumb_up),
                        ),
                        new Padding(
                          padding: new EdgeInsets.all(7.0),
                          child: new Text(
                            'Like',
                            style: new TextStyle(fontSize: 18.0),
                          ),
                        ),
                        new Padding(
                          padding: new EdgeInsets.all(7.0),
                          child: new Icon(Icons.comment),
                        ),
                        new Padding(
                          padding: new EdgeInsets.all(7.0),
                          child: new Text('Comments',
                              style: new TextStyle(fontSize: 18.0)),
                        )
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
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
    return new TextField(
      controller: _searchViewController,
      decoration: InputDecoration(
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(20.0),
          ),
        ),
        hintText: "Search",
        hintStyle: new TextStyle(color: Colors.orange),
      ),
      textAlign: TextAlign.center,
    );
  }
}
