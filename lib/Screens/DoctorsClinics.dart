import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:myproject/AllApp/NavigationDrawer.dart';
import 'package:myproject/Classess/DoctorsClinic.dart';
import 'package:myproject/Classess/post.dart';
import 'package:myproject/Screens/InformationClinics.dart';
import 'dart:math' as math;
import 'package:edge_alert/edge_alert.dart';
class DoctorsClinics extends StatefulWidget {
  TextStyle _title, _stylePagesTitle, _stylePagesSubTitle, _textSearch;
  List<DoctorsClinic> myClinic = List<DoctorsClinic>();
  List<DoctorsClinic> tempSearch = List<DoctorsClinic>();
  List<DoctorsClinic> tempSearch2 = List<DoctorsClinic>();

  DoctorsClinics(this.myClinic, this._title, this._textSearch,
      this._stylePagesTitle, this._stylePagesSubTitle);

  @override
  _DoctorsClinicsState createState() => _DoctorsClinicsState();
}

class _DoctorsClinicsState extends State<DoctorsClinics> {
  var txt = TextEditingController();
  bool ch = false;
   final String _url='http://192.168.43.2/pharm/images/AllProject/Pages/5.jpg';
 // final String _url='http://muayad.aba.vg/images/AllProject/Pages/5.jpg';
  TextStyle t = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Color.fromRGBO(0, 0, 0, 10),
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
    letterSpacing: 1,
  );

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
              floating: true,
              pinned: true,
              titleSpacing: 29,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'عيادات الاطباء',
                  style: widget._title,
                ),
                centerTitle: true,
                background: Image.network(_url,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                minHeight: 60.0,
                maxHeight: 70.0,
                child: Container(
                  child: _search(), //Center(child: Text('headerText'))
                ),
              ),
            ),
            new SliverList(
              delegate: new SliverChildListDelegate(
                new List.generate(
                  _LengthOfList(widget.myClinic.length),
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
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => InformationClinics(
                widget.myClinic[index],
                widget._stylePagesTitle,
                widget._stylePagesSubTitle),
            //momo(widget.myClinic[index]),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        //only(top: 5, right: 10, left: 10, bottom: 5),
        child: Card(
          elevation: 7,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(18.0),
            ),
          ),
          child: SizedBox(
            width: double.infinity, //MediaQuery.of(context).size.width,
            height: 110, //_height(),
            child: Row(
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 30),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                InformationClinics(
                                    widget.myClinic[index],
                                    widget._stylePagesTitle,
                                    widget._stylePagesSubTitle),
                            //momo(widget.myClinic[index]),
                          ),
                        );
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
                            height: 0,
                          ),
                          Text(
                            '${widget.myClinic[index].DoctorsName}',
                            style: widget._stylePagesTitle,
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: AutoSizeText(
                              //'This string will be automatically resized to fit in two lines.',
                              '${widget.myClinic[index].DoctorSpecific}',
                              style: widget._stylePagesSubTitle,
                              textAlign: TextAlign.right,
                              maxLines: 3,
                              minFontSize: 13,
                            ),
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
                    await Post.FeachsearchDoctor(context, txt.text.trim());
                if (widget.tempSearch.length != 0) {
                  setState(() {
                    widget.tempSearch2 = widget.myClinic;
                    widget.myClinic = widget.tempSearch;
                  });
                } else {
                  EdgeAlert.show(
                    context,
                    title: '',
                    description: 'لايوجد طبيب بهذا الاسم',
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
              ),
            ),
            title: new TextField(
              onSubmitted: (str) async {
                widget.tempSearch =
                    await Post.FeachsearchDoctor(context, txt.text.trim());
                // print('${widget.tempSearch.length}');
                if (widget.tempSearch.length != 0) {
                  setState(() {
                    widget.tempSearch2 = widget.myClinic;
                    widget.myClinic = widget.tempSearch;
                  });
                } else {
                  EdgeAlert.show(
                    context,
                    title: '',
                    description: 'لايوجد طبيب بهذا الاسم',
                    gravity: EdgeAlert.TOP,
                    backgroundColor: Colors.red,
                    icon: Icons.error,
                  );
                }
              },
              controller: txt,
              decoration: new InputDecoration(
                hintText: 'بحث...',
                border: InputBorder.none,
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
                icon: new Icon(Icons.clear,color: ch?Colors.indigoAccent:Colors.grey,),
                onPressed: () {
                  setState(() {
                    txt.clear();
                    ch = false;
                    // print(widget.tempSearch2.length);
                    if (widget.tempSearch2.length != 0) {
                      setState(() {
                        widget.myClinic = widget.tempSearch2;
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
