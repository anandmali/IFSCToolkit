import 'package:flutter/material.dart';
import 'package:ifsctoolkit/search_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ifsctoolkit/search_event.dart';

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
  late SearchBloc _searchBloc;

  String _query = ""; //Holder for search text

  final _searchViewController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    _searchBloc = BlocProvider.of<SearchBloc>(context);
    _searchViewController.addListener(_onSearchQueryChanged);
  }

  void _onSearchQueryChanged() {
    _searchBloc
        .add(SearchQueryChanged(searchQuery: _searchViewController.text));
  }

  void _onSearchClicked() {
    _searchBloc.add(SearchClickedEvent());

    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(_searchBloc.state.searchQuery),
      ));
    });
  }

  @override
  void dispose() {
    _searchBloc.close();
    _searchViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SearchBloc>(
        create: (context) => SearchBloc(),
        child: SafeArea(
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
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(38.0),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(0, 2),
                        blurRadius: 8.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 4, bottom: 4),
                  child: TextField(
                    controller: _searchViewController,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'IFSC code...',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(38.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    offset: const Offset(0, 2),
                    blurRadius: 8.0),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32.0),
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  _onSearchClicked();
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(Icons.search),
                  // size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
