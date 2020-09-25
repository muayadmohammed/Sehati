import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myproject/AllApp/NavigationDrawer.dart';
import 'package:myproject/Classess/PharmacyAddress.dart';
import 'package:myproject/Classess/post.dart';
import 'package:myproject/Screens/InformationPharmcyAddress.dart';
import 'dart:math' as math;
import 'package:toast/toast.dart';

class PharmacyAddress extends StatefulWidget {
  TextStyle _title, _stylePagesTitle, _stylePagesSubTitle, _textSearch;
  List<PharmacyAddres> myPharmacyAddress = List<PharmacyAddres>();
  List<PharmacyAddres> tempSearch = List<PharmacyAddres>();
  List<PharmacyAddres> tempSearch2 = List<PharmacyAddres>();

  PharmacyAddress(this.myPharmacyAddress, this._title, this._textSearch,
      this._stylePagesTitle, this._stylePagesSubTitle);

  @override
  _PharmacyAddressState createState() => _PharmacyAddressState();
}

class _PharmacyAddressState extends State<PharmacyAddress> {
  var txt = TextEditingController();
  bool ch = false;

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
                background: Image.asset(
                  'assets/images/pages/f1.png',
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
                  _LengthOfList(widget.myPharmacyAddress.length),
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
              builder: (BuildContext context) => InformationPharmacyAddress(
                  widget.myPharmacyAddress[index],
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
            height: 100,
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
                                InformationPharmacyAddress(
                                    widget.myPharmacyAddress[index],
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
                          Text(
                            '${widget.myPharmacyAddress[index].PharmacyName}',
                            style: widget._stylePagesTitle,
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${widget.myPharmacyAddress[index].Governorate}',
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
                      await Post.FeachsearchPharmacy(context, txt.text.trim());
                  if (widget.tempSearch.length != 0) {
                    setState(() {
                      widget.tempSearch2 = widget.myPharmacyAddress;
                      widget.myPharmacyAddress = widget.tempSearch;
                    });
                  } else {
                    Toast.show("!! غير موجود  ", context);
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
                    await Post.FeachsearchPharmacy(context, txt.text.trim());
                if (widget.tempSearch.length != 0) {
                  setState(() {
                    widget.tempSearch2 = widget.myPharmacyAddress;
                    widget.myPharmacyAddress = widget.tempSearch;
                  });
                } else {
                  Toast.show("!! غير موجود  ", context);
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
                        widget.myPharmacyAddress = widget.tempSearch2;
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
