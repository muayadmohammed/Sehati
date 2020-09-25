import 'package:edge_alert/edge_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:myproject/AllApp/NavigationDrawer.dart';
import 'package:myproject/Classess/mydrugs.dart';
import 'package:myproject/Classess/post.dart';
import 'package:myproject/Screens/InformationDrugs.dart';
import 'dart:math' as math;

class Drugs extends StatefulWidget {
  TextStyle _title, _stylePagesTitle, _stylePagesSubTitle, _textSearch;

  List<MyDruge> listDruges = List();

  List<MyDruge> tempSearch = List<MyDruge>();
  List<MyDruge> tempSearch2 = List<MyDruge>();

  Drugs(this.listDruges, this._title, this._textSearch, this._stylePagesTitle,
      this._stylePagesSubTitle);

  @override
  _DrugsState createState() => _DrugsState();
}

class _DrugsState extends State<Drugs> {
  var textController = TextEditingController();
  bool textchaning = false;
  final String _url = 'http://192.168.0.107/pharm/images/AllProject/Pages/1.png';
   // final String _url='http://muayad.aba.vg/images/AllProject/Pages/1.png';
  // void initState (){
  //   super.initState();
  //   CircularProgressIndicator();
  //   // TODO initial state stuff
  //   new Future.delayed(const Duration(seconds: 4)
 
    
  //   );
  // }
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
                  'أدوية',
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
                child: Container(
                  child: _search(), //Center(child: Text('headerText'))
                ),
              ),
            ),
            new SliverList(
              delegate: new SliverChildListDelegate(
                new List.generate(
                  // widget.listDruges.length,
                  _LengthOfList(widget.listDruges.length),
                  (int index) => Column(
                    children: [_content(index)],
                  ),
                ),
              ),
            )
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
      padding: const EdgeInsets.symmetric(horizontal: 5),
      //only(top: 5, right: 10, left: 10, bottom: 5),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => InformationDrugs(
                  widget.listDruges[index],
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
            width: MediaQuery.of(context).size.width,
            height: 105,
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
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => InformationDrugs(
                                widget.listDruges[index],
                                widget._stylePagesTitle,
                                widget._stylePagesSubTitle)));
                      },
                      child: Icon(
                        Icons.arrow_back,
                        //MdiIcons.markerCancel,
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
                            '${widget.listDruges[index].mapDrugs[0]["ScientificName"]}',
                            style: widget._stylePagesTitle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              widget.listDruges[index].mapPharmacy[0]
                                  ["PharmacyName"],
                              style: widget._stylePagesSubTitle,
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
            //print("///${await Post.FeachsearchDoctor(context, txt.text.trim())}");
            widget.tempSearch = await Post.FeachsearchDrugs(
                context, textController.text.trim());
            //print('${widget.tempSearch.length}');
            if (widget.tempSearch.length != 0) {
              setState(() {
                widget.tempSearch2 = widget.listDruges;
                widget.listDruges = widget.tempSearch;
              });
            } else {
              EdgeAlert.show(
                context,
                title: '',
                description: 'لايوجد دواء بهذا الاسم',
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
                  color: textchaning ? Colors.indigoAccent : Colors.grey,
                ),
              ),
            ),
            title: new TextField(
              onSubmitted: (str) async {
                //print("///${await Post.FeachsearchDoctor(context, txt.text.trim())}");
                widget.tempSearch = await Post.FeachsearchDrugs(
                    context, textController.text.trim());
                //print('${widget.tempSearch.length}');
                if (widget.tempSearch.length != 0) {
                  setState(() {
                    widget.tempSearch2 = widget.listDruges;
                    widget.listDruges = widget.tempSearch;
                  });
                } else {
                  // _showDialog();
                  EdgeAlert.show(
                    context,
                    title: '',
                    description: 'لايوجد دواء بهذا الاسم',
                    gravity: EdgeAlert.TOP,
                    backgroundColor: Colors.red,
                    icon: Icons.error,
                  );
                }
              },
              controller: textController,
              decoration: new InputDecoration(
                // hintText: 'ادخل اسم الصيدلة او اسم الدواء والشركة ',
                  hintText: 'بحث ...',
                border: InputBorder.none,
                hoverColor: Colors.indigoAccent,
                isDense: false,
                hintStyle:  widget._textSearch,
                 //TextStyle(
                //   fontFamily: ArabicFonts.Cairo,
                //   package: 'google_fonts_arabic',
                //   letterSpacing: 1,
                //   fontWeight: FontWeight.w500,
                //   color: Colors.black,
                //   fontSize: 10,
                // ),
            
              ),
              onChanged: (textString) {
                setState(() {
                  if (textString.length > 0) {
                    textchaning = true;
                  } else {
                    textchaning = false;
                  }
                });
              },
            ),
            trailing: Visibility(
              visible: textchaning,
              child: new IconButton(
                icon: new Icon(
                  Icons.clear,
                  color: textchaning ? Colors.indigoAccent : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    textController.clear();
                    textchaning = false;
                    // print(widget.tempSearch2.length);
                    if (widget.tempSearch2.length != 0) {
                      setState(() {
                        widget.listDruges = widget.tempSearch2;
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

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
                child: new Text(
              'ان لم تجد ما تبحث',
              textAlign: TextAlign.center,
            )),
            content: new Text(
              'تستطيع البحث عن اسماء الصيدليات اوعناوينها وكذلك اسماء الادوية العلمية او التجارية او الشركة',
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              new RaisedButton(
                child: new Text(
                  'اغلاق',
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
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
