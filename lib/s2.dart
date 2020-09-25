import 'package:flutter/material.dart';
import 'package:myproject/test.dart';
import 'package:scoped_model/scoped_model.dart';

import 'Screens/HomePages.dart';

//class s2 extends StatefulWidget {
//  @override
//  _s2State createState() => _s2State();
//}
//
//class _s2State extends State<s2> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text('s2'),),
//      body: InkWell(
//        onTap: (){
//          Navigator.of(context).push(
//            MaterialPageRoute(
//              builder: (BuildContext context) => s1(),
//            ),
//          );
//        },
//        child: Hero(
//            tag: 'a',
//            child: Image.asset('assets/images/login/a.png')),
//      ),
//    );
//  }
//}


//
//class SearchListExample extends StatefulWidget {
//  @override
//  _SearchListExampleState createState() => new _SearchListExampleState();
//}
//
//class _SearchListExampleState extends State<SearchListExample> {
//  Widget appBarTitle = new Text(
//    "Search Example",
//    style: new TextStyle(color: Colors.white),
//  );
//  Icon icon = new Icon(
//    Icons.search,
//    color: Colors.white,
//  );
//  final globalKey = new GlobalKey<ScaffoldState>();
//  final TextEditingController _controller = new TextEditingController();
//  List<dynamic> _list;
//  bool _isSearching;
//  String _searchText = "";
//  List searchresult = new List();
//
//  _SearchListExampleState() {
//    _controller.addListener(() {
//      if (_controller.text.isEmpty) {
//        setState(() {
//          _isSearching = false;
//          _searchText = "";
//        });
//      } else {
//        setState(() {
//          _isSearching = true;
//          _searchText = _controller.text;
//        });
//      }
//    });
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    _isSearching = false;
//    values();
//  }
//
//  void values() {
//    _list = List();
//    _list.add("Indian rupee");
//    _list.add("United States dollar");
//    _list.add("Australian dollar");
//    _list.add("Euro");
//    _list.add("British pound");
//    _list.add("Yemeni rial");
//    _list.add("Japanese yen");
//    _list.add("Hong Kong dollar");
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//        key: globalKey,
//        appBar: buildAppBar(context),
//        body: new Container(
//          child: new Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            mainAxisSize: MainAxisSize.min,
//            children: <Widget>[
//              new Flexible(
//                  child: searchresult.length != 0 || _controller.text.isNotEmpty
//                      ? new ListView.builder(
//                    shrinkWrap: true,
//                    itemCount: searchresult.length,
//                    itemBuilder: (BuildContext context, int index) {
//                      String listData = searchresult[index];
//                      return new ListTile(
//                        title: new Text(listData.toString()),
//                      );
//                    },
//                  )
//                      : new ListView.builder(
//                    shrinkWrap: true,
//                    itemCount: _list.length,
//                    itemBuilder: (BuildContext context, int index) {
//                      String listData = _list[index];
//                      return new ListTile(
//                        title: new Text(listData.toString()),
//                      );
//                    },
//                  ))
//            ],
//          ),
//        ));
//  }
//
//  Widget buildAppBar(BuildContext context) {
//    return new AppBar(centerTitle: true, title: appBarTitle, actions: <Widget>[
//      new IconButton(
//        icon: icon,
//        onPressed: () {
//          setState(() {
//            if (this.icon.icon == Icons.search) {
//              this.icon = new Icon(
//                Icons.close,
//                color: Colors.white,
//              );
//              this.appBarTitle = new TextField(
//                controller: _controller,
//                style: new TextStyle(
//                  color: Colors.white,
//                ),
//                decoration: new InputDecoration(
//                    prefixIcon: new Icon(Icons.search, color: Colors.white),
//                    hintText: "Search...",
//                    hintStyle: new TextStyle(color: Colors.white)),
//                onChanged: searchOperation,
//              );
//              _handleSearchStart();
//            } else {
//              _handleSearchEnd();
//            }
//          });
//        },
//      ),
//    ]);
//  }
//
//  void _handleSearchStart() {
//    setState(() {
//      _isSearching = true;
//    });
//  }
//
//  void _handleSearchEnd() {
//    setState(() {
//      this.icon = new Icon(
//        Icons.search,
//        color: Colors.white,
//      );
//      this.appBarTitle = new Text(
//        "Search Sample",
//        style: new TextStyle(color: Colors.white),
//      );
//      _isSearching = false;
//      _controller.clear();
//    });
//  }
//
//  void searchOperation(String searchText) {
//    searchresult.clear();
//    if (_isSearching != null) {
//      for (int i = 0; i < _list.length; i++) {
//        String data = _list[i];
//        if (data.toLowerCase().contains(searchText.toLowerCase())) {
//          searchresult.add(data);
//        }
//      }
//    }
//  }
//}
/*
class SearchScreen extends StatefulWidget {
  @override
  SearchScreenState createState() {
    return new SearchScreenState();
  }
}

class SearchScreenState extends State<SearchScreen> {
  ScrollController controller;
  int page = 1;

  @override
  void initState() {
    super.initState();
    controller = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void _scrollListener() {
    var props = PropertyScopedModel.of(context);
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      print("Reached end");
      if (!props.isLoadingMore && props.hasMorePages) {
        page++;
        print("UI page: $page");
        props.getProperties(props.placeName, page);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<PropertyScopedModel>(
        builder: (context, child, model) {
          return CustomScrollView(
            controller: controller,
            slivers: <Widget>[
              SliverAppBar(
                title: SearchWidget(
                  performSearch: model.getProperties,
                ),
                floating: true,
                snap: true,
              ),
              model.isLoading
                  ? SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
                  : model.getPropertyCount() < 1
                  ? SliverFillRemaining(
                child: Center(
                  child: Text(
                    model.statusText,
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),
              )
                  : SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
//                              print("Index: $index");
                    if (index == model.getPropertyCount() + 1) {
                      if (model.hasMorePages) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0),
                          child: Center(
                              child: CircularProgressIndicator()),
                        );
                      }
                      return Container();
                    } else if (index == 0) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey[300]))),
                        child: Text(
                          "${model.totalResults} results",
                          style: Theme.of(context)
                              .textTheme
                              .body2
                              .copyWith(color: Colors.grey[600]),
                        ),
                      );
                    } else {
                      return Column(
                        children: <Widget>[
                          InkWell(
                            child: PropertyItem(
                                model.properties[index - 1]),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>HomePages()
//                                        DetailScreen(model.properties[index - 1])
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0),
                            child: Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      );
                    }
                  },
                  childCount: model.getPropertyCount() + 2,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}


 */