import 'dart:async';
import 'package:myproject/Classess/Hospital.dart';
import 'package:myproject/Screens/Hospital.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:edge_alert/edge_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:myproject/AllApp/NavigationDrawer.dart';
import 'package:myproject/Classess/BeautyandMakeup.dart';
import 'package:myproject/Classess/CentersandDevice.dart';
import 'package:myproject/Classess/DoctorsClinic.dart';
import 'package:myproject/Classess/Laboratories.dart';
import 'package:myproject/Classess/PharmacyAddress.dart';
import 'package:myproject/Classess/mydrugs.dart';
import 'package:myproject/Classess/post.dart';
import 'package:myproject/Screens/Cosmetics.dart';
import 'package:myproject/Screens/DevicesMedical.dart';
import 'package:myproject/Screens/DoctorsClinics.dart';
import 'package:myproject/Screens/Drugs.dart';
import 'package:myproject/Screens/LaboratoriesAddresses.dart';
import 'package:myproject/Screens/PharmacyAddress.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  TextStyle _textHomePages = TextStyle(
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
    letterSpacing: 1,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 18,
  );
  TextStyle _title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
  );
  TextStyle _textSearch = TextStyle(
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
    letterSpacing: 1,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 16,
  );
  TextStyle _stylePagesTitle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Color.fromRGBO(8, 14, 18, 10),
    fontFamily: ArabicFonts.Changa,
    package: 'google_fonts_arabic',
    letterSpacing: 1,
  );
  TextStyle _stylePagesSubTitle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold,
//    color: Color.fromRGBO(0, 0, 0, 10),
    color:Color(0xFF131E9C),
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
    letterSpacing: 1,
  );

   final String _url='http://192.168.0.107/pharm/images/AllProject/';
// final String _url = 'http://muayad.aba.vg/images/AllProject/';

  @override 
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: NavigationDrawer(),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: StaggeredGridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: <Widget>[
              _appBar(_url + 's1.png'),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: InkWell(
                    onTap: () => gotoDrug(),
                    child: _ContentList('أدوية', _url + 'on.png')),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: InkWell(
                  onTap: () => gotoBeautyandMakeup(),
                  child: _ContentList('مستحضرات تجميل', _url + '2.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: InkWell(
                    onTap: () => gotoHospital(),
                    child: _ContentList('المستشفيات', _url + '4.png')),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: InkWell(
                    onTap: () => gotoCentersandDevice(),
                    child: _ContentList('أجهزة طبية', _url + '3.png')),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: InkWell(
                    onTap: () {
                      gotoDoctorsClinic();
                    },
                    child: _ContentList('عيادات الاطباء', _url + '6.png')),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: InkWell(
                  onTap: () => gotoLaboratories(),
                  child: _ContentList('المختبرات', _url + '5.png'),
                  focusColor: Colors.red,
                ),
              ),
            ],
            staggeredTiles: [
              StaggeredTile.extent(
                2,
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 125
                    : 100,
              ),
              StaggeredTile.extent(1, orientation()),
              StaggeredTile.extent(1, orientation()),
              StaggeredTile.extent(1, orientation()),
              StaggeredTile.extent(1, orientation()),
              StaggeredTile.extent(1, orientation()),
              StaggeredTile.extent(1, orientation()),
            ],
            physics: ScrollPhysics(),
          ),
        ),
        // bottomNavigationBar: homepage(),
      ),
    );
  }

  Widget _mm() {
    return CircularProgressIndicator();
  }

  double orientation() {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      double x = MediaQuery.of(context).size.height / 4.5;
      return x;
    } else {
      return 145;
    }
  }

  Material _ContentList(String _title, String _link) {
    return Material(
      //color: Colors.white38,
      elevation: 5, shadowColor: Colors.black87,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(18.0),
        ),
      ),

      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText(
                        _title,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                        ),
                        minFontSize: 10,
                        stepGranularity: 10,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,

                        //    style: _text_HomePages,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 70
                        : 80,
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 70
                        : 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFF8ECEFC),
                    ),
                    child: Image.network(_link),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar(String _link) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(18.0),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(),
        child: Image.network(
          _link,
          fit: MediaQuery.of(context).orientation == Orientation.portrait
              ? BoxFit.cover
              : BoxFit.contain,
        ),
      ),
    );
  }

  Material _search() {
    return Material(
      // color: Colors.white38,
      elevation: 20,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 22),
        decoration: BoxDecoration(),
        child: TextField(
          textAlign: TextAlign.right,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: "...بحث",
              hoverColor: Colors.indigoAccent,
              isDense: false,
              hintStyle: _textHomePages
              //    TextStyle(color: Colors.grey, fontSize: 22.0)
              ),
        ),
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
  Future<Null> gotoDrug() async {
    List<MyDruge> list = await Post.postDrugs(context);
    if (list.length > 0) {
    
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => Drugs(
              list, _title, _textSearch, _stylePagesTitle, _stylePagesSubTitle,),
        ),
      );
    }
  }

  Future<Null> gotoBeautyandMakeup() async {
    List<BeautyandMakeup> list = await Post.postBeautyandMakeup(context);

    if (list.length > 0) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => Cosmetics(
              list, _title, _textSearch, _stylePagesTitle, _stylePagesSubTitle),
        ),
      );
    }
  }

  Future<Null> gotoCentersandDevice() async {
    List<CentersandDevice> list = await Post.postCentersandDevice(context);

    if (list.length > 0) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => DevicesMedical(
              list, _title, _textSearch, _stylePagesTitle, _stylePagesSubTitle),
        ),
      );
    }
  }

  Future<Null> gotoPharmacyAddress() async {
    List<PharmacyAddres> list = await Post.postPharmacyAddres(context);

    if (list.length > 0) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => PharmacyAddress(
              list, _title, _textSearch, _stylePagesTitle, _stylePagesSubTitle),
        ),
      );
    }
  }

  Future<Null> gotoHospital() async {
    List<Hospitall> list = await Post.postHospital(context);

    if (list.length > 0) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => Hospital(
              list, _title, _textSearch, _stylePagesTitle, _stylePagesSubTitle),
        ),
      );
    }
  }

  Future<Null> gotoLaboratories() async {
    List<Laboratories> list = await Post.postLaboratories(context);

    if (list.length > 0) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => LaboratoriesAddresses(
              list, _title, _textSearch, _stylePagesTitle, _stylePagesSubTitle),
        ),
      );
    }
  }

  Future<Null> gotoDoctorsClinic() async {
    List<DoctorsClinic> list = await Post.postDoctorsClinic(context);

    if (list.length > 0) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => DoctorsClinics(
              list, _title, _textSearch, _stylePagesTitle, _stylePagesSubTitle),
        ),
      );
    } else if (list.length == 0) {
      EdgeAlert.show(
        context,
        title: '',
        description: 'تحقق من الاتصال بالانترنت',
        gravity: EdgeAlert.TOP,
        backgroundColor: Colors.red,
        icon: Icons.error,
      );
    }
  }
}
