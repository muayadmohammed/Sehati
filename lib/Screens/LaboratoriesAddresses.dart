import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproject/AllApp/NavigationDrawer.dart';
import 'package:myproject/Classess/Laboratories.dart';
import 'package:myproject/Classess/post.dart';
import 'package:myproject/Screens/InformationLaboratoriesAddresses.dart';

import 'dart:math' as math;

import 'package:toast/toast.dart';

class LaboratoriesAddresses extends StatefulWidget {
  TextStyle _title,_stylePagesTitle,_stylePagesSubTitle,_textSearch;

  List<Laboratories> myLaboratories = List<Laboratories>();
  List<Laboratories> tempSearch = List<Laboratories>();
  List<Laboratories> tempSearch2 = List<Laboratories>();

  LaboratoriesAddresses(this.myLaboratories,this._title,this._textSearch,this._stylePagesTitle,this._stylePagesSubTitle);

  @override
  _LaboratoriesAddressesState createState() => _LaboratoriesAddressesState();
}

class _LaboratoriesAddressesState extends State<LaboratoriesAddresses> {
  var textController = TextEditingController();
  bool ch = false;
final String _url='http://192.168.0.107/pharm/images/AllProject/Pages/6.png';
//final String _url='http://muayad.aba.vg/images/AllProject/Pages/6.png';
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
              floating: true,
              pinned: true,
              titleSpacing: 29,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'المختبرات',
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
                  _LengthOfList(widget.myLaboratories.length
                  ),


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
      return widget.myLaboratories.length;
    }else{
    return widget.myLaboratories.length;
    }
  }

  Widget _content(var index) {
    return InkWell(
      onTap: () {

        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => InformationLaboratoriesAddresses(
                widget.myLaboratories[index],widget._stylePagesTitle,widget._stylePagesSubTitle)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        //only(top: 5, right: 10, left: 10, bottom: 5),
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(18.0),
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            height: 100, //_height(),
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
                                InformationLaboratoriesAddresses(
                                    widget.myLaboratories[index],widget._stylePagesTitle,widget._stylePagesSubTitle),
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
                            height: 5,
                          ),
                          Text(
                            '${widget.myLaboratories[index].LabName}',
                            style: widget._stylePagesTitle,
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${widget.myLaboratories[index].LabSpecific}',
                            style: widget._stylePagesSubTitle,
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(
                            height: 5,
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

  double _height() {
    double _height = MediaQuery.of(context).size.height / 4.5;
    if (_height <= 160) {
      return 160.0;
    } else {
      return 160.0;
    }
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
                  widget.tempSearch = await Post.FeachsearchLab(
                      context, textController.text.trim());
                  if (widget.tempSearch.length != 0) {
                    setState(() {
                      widget.tempSearch2 = widget.myLaboratories;
                      widget.myLaboratories = widget.tempSearch;
                    });
                  } else {
                    Toast.show("!! غير موجود  ", context);
                  }
                },
                child:Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: new Icon(Icons.search
                    ,color: ch?Colors.indigoAccent:Colors.grey,),
                ),

            ),
            title: new TextField(
              onSubmitted: (str)async {
                widget.tempSearch = await Post.FeachsearchLab(
                    context, textController.text.trim());
                if (widget.tempSearch.length != 0) {
                  setState(() {
                    widget.tempSearch2 = widget.myLaboratories;
                    widget.myLaboratories = widget.tempSearch;
                  });
                } else {
                  Toast.show("!! غير موجود  ", context);
                }
              },
              controller: textController,
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
                icon: new Icon(Icons.clear,color: ch?Colors.indigoAccent:Colors.grey,),
                onPressed: () {
                  setState(() {
                    textController.clear();
                    ch = false;
                    if (widget.tempSearch2.length != 0) {
                      setState(() {
                        widget.myLaboratories = widget.tempSearch2;
                      });
                    }
                  });
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
