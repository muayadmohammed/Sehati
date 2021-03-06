import 'package:auto_size_text/auto_size_text.dart';
import 'package:edge_alert/edge_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproject/AllApp/NavigationDrawer.dart';
import 'package:myproject/Classess/Hospital.dart';
import 'package:myproject/Classess/post.dart';
import 'dart:math' as math;
import 'InformatiomHospital.dart';

class Hospital extends StatefulWidget {
  TextStyle _title, _stylePagesTitle, _stylePagesSubTitle, _textSearch;
  List<Hospitall> myHospital = List<Hospitall>();
  List<Hospitall> tempSearch = List<Hospitall>();
  List<Hospitall> tempSearch2 = List<Hospitall>();

  Hospital(this.myHospital, this._title, this._textSearch,
      this._stylePagesTitle, this._stylePagesSubTitle);

  @override
  _HospitalState createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {
  var txt = TextEditingController();
  bool ch = false;
 final String _url='http://192.168.0.107/pharm/images/AllProject/Pages/4.png';
 //  final String _url='http://muayad.aba.vg/images/AllProject/Pages/4.png';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              iconTheme: IconThemeData(color: Colors.black),
              expandedHeight: 150,
              backgroundColor: Colors.blueAccent,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'المستشفيات',
                  style: widget._title,
                ),
                centerTitle: true,
                background: Image.network(
                 _url,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                minHeight: 60.0,
                maxHeight: 70.0,
                child: _search(), //Center(child: Text('headerText'))

              ),
            ),
            new SliverList(
              delegate: new SliverChildListDelegate(
                new List.generate(
                  _LengthOfList(widget.myHospital.length),
                  (int index) => new Column(
                    children: <Widget>[
                      _content(index),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        endDrawer: NavigationDrawer(),
      ),
    );
  }

  int _LengthOfList(int length) {
    if (length >= 25) {
      return 25;
    } else {
      return length;
    }
  }

  Widget _content(var index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      //only(top: 5, right: 10, left: 10, bottom: 5),
      child: InkWell(
        onTap: () {
          // print(MediaQuery.of(context).size.width);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => InformationHospital(
                  widget.myHospital[index],
                  widget._stylePagesTitle,
                  widget._stylePagesSubTitle)));
        },
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(18.0),
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            height: 110,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 30),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                InformationHospital(
                                    widget.myHospital[index],
                                    widget._stylePagesTitle,
                                    widget._stylePagesSubTitle)));
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: Color(0xFF2699FB),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: AutoSizeText(
                          //'This string will be automatically resized to fit in two lines.',
                          '${widget.myHospital[index].HospitalName}',textAlign: TextAlign.right,
                          style: widget._stylePagesTitle,)
                      ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${widget.myHospital[index].Governorate}',
                            style: widget._stylePagesSubTitle,
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _search() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(18.0),
          ),
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListTile(
            leading: GestureDetector(
                onTap: () async {
                  widget.tempSearch =
                      await Post.FeachsearchHospital(context, txt.text.trim());
                  if (widget.tempSearch.length != 0) {
                    setState(() {
                      widget.tempSearch2 = widget.myHospital;
                      widget.myHospital = widget.tempSearch;
                    });
                  } else {
                    EdgeAlert.show(
                      context,
                      title: '',
                      description: '!! غير موجود  ',
                      gravity: EdgeAlert.TOP,
                      backgroundColor: Colors.red,
                      icon: Icons.error,
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: new Icon(
                    Icons.search,
                    color: ch ? Colors.indigoAccent : Colors.grey,
                  ),
                )),
            title: new TextField(
              onSubmitted: (str) async {
                widget.tempSearch =
                    await Post.FeachsearchHospital(context, txt.text.trim());
                if (widget.tempSearch.length != 0) {
                  setState(() {
                    widget.tempSearch2 = widget.myHospital;
                    widget.myHospital = widget.tempSearch;
                  });
                } else {
                  EdgeAlert.show(
                    context,
                    title: '',
                    description: '!! غير موجود  ',
                    gravity: EdgeAlert.TOP,
                    backgroundColor: Colors.red,
                    icon: Icons.error,
                  );
                }
              },
              controller: txt,
              decoration: new InputDecoration(
                hintText: 'بحث ...',
                border: InputBorder.none,
                hoverColor: Colors.indigoAccent,
                isDense: false,
                hintStyle: widget._textSearch,
              ),
              onChanged: (str) {
                setState(() {
                  if (str.length > 0) {
                    ch = true;
                  } else {
                    ch = false;
                  }
                });
              },
            ),
            trailing: Visibility(
              visible: ch,
              child: new IconButton(
                icon: new Icon(
                  Icons.clear,
                  color: ch ? Colors.indigoAccent : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    txt.clear();
                    ch = false;
                    // print(widget.tempSearch2.length);
                    if (widget.tempSearch2.length != 0) {
                      setState(() {
                        widget.myHospital = widget.tempSearch2;
                        // widget.tempSearch2.clear();
                      });
                    }
                  });
                  // onSearchTextChanged('');
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
