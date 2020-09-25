import 'package:edge_alert/edge_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math'as math;
import 'package:myproject/AllApp/NavigationDrawer.dart';
import 'package:myproject/Classess/CentersandDevice.dart';
import 'package:myproject/Classess/post.dart';
import 'InformationDevices.dart';


class DevicesMedical extends StatefulWidget {
  TextStyle _title,_stylePagesTitle,_stylePagesSubTitle,_textSearch;
  List<CentersandDevice>  myDevicesMedical=List<CentersandDevice>();

  List<CentersandDevice> tempSearch = List<CentersandDevice>();
  List<CentersandDevice> tempSearch2 = List<CentersandDevice>();

  DevicesMedical(this.myDevicesMedical,this._title,this._textSearch,this._stylePagesTitle,this._stylePagesSubTitle);

  @override
  _DevicesMedicalState createState() => _DevicesMedicalState();
}

class _DevicesMedicalState extends State<DevicesMedical> {
  var textController = TextEditingController();
  bool textchaning = false;
  @override

  final String _url='http://192.168.0.107/pharm/images/AllProject/Pages/3.jpg';
//  final String _url='http://muayad.aba.vg/images/AllProject/Pages/3.jpg';
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
                title: Text( 'أجهزة طبية',
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
                _LengthOfList(widget.myDevicesMedical.length),
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
      return widget.myDevicesMedical.length;
    }
  }
  Widget _content(var index) {
    double _c = MediaQuery.of(context).size.height / 4.5;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 0),
      //only(top: 5, right: 10, left: 10, bottom: 5),
      child: InkWell(
        onTap: () {

          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => InformationDevices(widget.myDevicesMedical[index],widget._stylePagesTitle,widget._stylePagesSubTitle)));
        },
        child: Card(elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(18.0),
            ),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 110,
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
                        //  print(_c);

                         Navigator.of(context).push(MaterialPageRoute(
                             builder: (BuildContext context) => InformationDevices(widget.myDevicesMedical[index],widget._stylePagesTitle,widget._stylePagesSubTitle)));
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
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                           Text(
                                '${widget.myDevicesMedical[index].mapDevice[0]['DeviceName']} ',
                                style: widget._stylePagesTitle,textAlign: TextAlign.right,
                              ),

                            SizedBox(
                              height: 10,
                            ),
                            Text('${widget.myDevicesMedical[index].mapCenter[0]['CenterName']}', style: widget._stylePagesSubTitle
                            ,textAlign: TextAlign.right,
                            ),
                          ],
                        ),
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
                  //print("///${await Post.FeachsearchDoctor(context, txt.text.trim())}");
                  widget.tempSearch =
                  await Post.FeachsearchCentersandDevice(context, textController.text.trim());
                  //print('${widget.tempSearch.length}');
                  if (widget.tempSearch.length != 0) {
                    setState(() {
                      widget.tempSearch2 = widget.myDevicesMedical;
                      widget.myDevicesMedical = widget.tempSearch;
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
                  child: new Icon(Icons.search
                    ,color: textchaning?Colors.indigoAccent:Colors.grey,),
                ),),
            title: new TextField(
              onSubmitted: (str)async {
                //print("///${await Post.FeachsearchDoctor(context, txt.text.trim())}");
                widget.tempSearch =
                await Post.FeachsearchCentersandDevice(context, textController.text.trim());
                //print('${widget.tempSearch.length}');
                if (widget.tempSearch.length != 0) {
                  setState(() {
                    widget.tempSearch2 = widget.myDevicesMedical;
                    widget.myDevicesMedical = widget.tempSearch;
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
              controller: textController,
              decoration: new InputDecoration(
                hintText: 'بحث ...',
                border: InputBorder.none,
                hoverColor: Colors.indigoAccent,
                isDense: false,
                hintStyle: widget._textSearch,
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
              child: new IconButton(hoverColor: Colors.indigoAccent,
                icon: new Icon(Icons.clear,color: textchaning?Colors.indigoAccent:Colors.grey,),
                onPressed: () {
                  setState(() {
                    textController.clear();
                    textchaning = false;
                    // print(widget.tempSearch2.length);
                    if (widget.tempSearch2.length != 0) {
                      setState(() {
                        widget.myDevicesMedical = widget.tempSearch2;
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