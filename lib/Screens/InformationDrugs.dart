import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:edge_alert/edge_alert.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:myproject/AllApp/NavigationDrawer.dart';
import 'package:myproject/Classess/mydrugs.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationDrugs extends StatefulWidget {
  MyDruge myDruge;
  TextStyle _stylePagesTitle, _stylePagesSubTitle;

  InformationDrugs(
      this.myDruge, this._stylePagesTitle, this._stylePagesSubTitle);

  @override
  _InformationDrugsState createState() => _InformationDrugsState();
}

class _InformationDrugsState extends State<InformationDrugs> {
  void _launchUrl(String Url) async {
    if (await canLaunch(Url)) {
      await launch(Url);
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
  }

  void _launchCall(String number) async {
    var _number = "tel:$number";
    _launchUrl(_number);
  }

  TextStyle _title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
  );
  String s1 = 'ص';

  String s2 = 'م';
  bool m = true;

  String _Time(String time) {
    List _ListHour = time.split(":");
    String _StringHour = _ListHour[0];
    var _intHour = int.parse(_StringHour);
    assert(_intHour is int);
//    print(widget.myLaboratoriesinfo.beginningWorking);
//    print(s1);

    if (_intHour >= 1 && _intHour <= 11 || _intHour == 00) {
      setState(() {
        m = true;
      });
      switch (_intHour) {
        case 1:
          return '1';
          break;
        case 2:
          return '2';
          break;
        case 3:
          return '3';
          break;
        case 4:
          return '4';
          break;
        case 5:
          return '5';
          break;
        case 6:
          return '6';
          break;
        case 7:
          return '7';
          break;
        case 8:
          return '8';
          break;
        case 9:
          return '9';
          break;
        case 10:
          return '10';
          break;
        case 11:
          return '11';
          break;
        case 00:
          return '12';
          break;
      }
    } else if (_intHour >= 12 && _intHour < 23) {
      setState(() {
        m = false;
      });
      switch (_intHour) {
        case 12:
          return '12 ';
          break;
        case 13:
          return '1';
          break;

        case 14:
          return '2';
          break;
        case 15:
          return '3';
          break;
        case 16:
          return '4';
          break;
        case 17:
          return '5';
          break;
        case 18:
          return '6';
          break;
        case 19:
          return '7';
          break;
        case 20:
          return '8';
          break;
        case 21:
          return '9';
          break;
        case 22:
          return '10';
          break;
        case 23:
          return '11';
          break;
      }
    }
  }

  int x, y;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'التفاصيل',
                  style: _title,
                ),
              ),
              SizedBox(
                width: 100,
                child: Divider(
                  height: 5,
                  color: Colors.white,
                  thickness: 2,
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
        endDrawer: NavigationDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(2),
          child: Align(
            alignment: Alignment.topRight,
            child: Card(
//              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(18.0),
                ),
              ),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '${widget.myDruge.mapDrugs[0]['CommonName']}',
                              style: widget._stylePagesSubTitle,
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 100,
                              height: 35,
                              decoration: BoxDecoration(
                                  //   border: Border.all(width: 1,color: Colors.blue)
                                  ),
                              child: Text(
                                'الاسـم التجاري',
                                style: widget._stylePagesTitle,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '${widget.myDruge.mapDrugs[0]['ScientificName']}',
                              style: widget._stylePagesSubTitle,
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 100,
                              height: 35,
                              decoration: BoxDecoration(
                                  //    border: Border.all(width: 1,color: Colors.blue)
                                  ),
                              child: Text(
                                'الاسم العلمي',
                                style: widget._stylePagesTitle,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '${widget.myDruge.mapDrugs[0]['DrugsCountry']}',
                              style: widget._stylePagesSubTitle,
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 100,
                              height: 35,
                              decoration: BoxDecoration(
                                  //  border: Border.all(width: 1,color: Colors.blue)
                                  ),
                              child: Text(
                                'الدولة',
                                style: widget._stylePagesTitle,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '${widget.myDruge.mapDrugs[0]['DrugsCompany']}',
                              style: widget._stylePagesSubTitle,
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 100,
                              height: 35,
                              decoration: BoxDecoration(
                                  //  border: Border.all(width: 1,color: Colors.blue)
                                  ),
                              child: Text(
                                'الشركة',
                                style: widget._stylePagesTitle,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '${widget.myDruge.Price}',
                              style: widget._stylePagesSubTitle,
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 100,
                              height: 35,
                              decoration: BoxDecoration(
                                  //  border: Border.all(width: 1,color: Colors.blue)
                                  ),
                              child: Text(
                                'السعر',
                                style: widget._stylePagesTitle,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '${widget.myDruge.ProductionDate}',
                              style: widget._stylePagesSubTitle,
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 100,
                              height: 35,
                              decoration: BoxDecoration(
                                  //  border: Border.all(width: 1,color: Colors.blue)
                                  ),
                              child: Text(
                                'تاريخ الانتاج',
                                style: widget._stylePagesTitle,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '${widget.myDruge.ExpirDate}',
                              style: widget._stylePagesSubTitle,
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 100,
                              height: 35,
                              decoration: BoxDecoration(
                                  //  border: Border.all(width: 1,color: Colors.blue)
                                  ),
                              child: Text(
                                'تاريخ الانتهاء',
                                style: widget._stylePagesTitle,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '${widget.myDruge.mapPharmacy[0]['PharmacyName']}',
                              style: widget._stylePagesSubTitle,
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 100,
                              height: 35,
                              decoration: BoxDecoration(
                                  //  border: Border.all(width: 1,color: Colors.blue)
                                  ),
                              child: Text(
                                'الصيدلية',
                                style: widget._stylePagesTitle,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '${widget.myDruge.mapPharmacy[0]['Governorate']}',
                              style: widget._stylePagesSubTitle,
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 100,
                              height: 35,
                              decoration: BoxDecoration(
                                  //  border: Border.all(width: 1,color: Colors.blue)
                                  ),
                              child: Text(
                                'المحافظة',
                                style: widget._stylePagesTitle,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            SizedBox(
                              width: 200.0,
                              height: 55.0,
                              child: AutoSizeText(
                                '${widget.myDruge.mapPharmacy[0]['Address']}',
                                style: widget._stylePagesSubTitle,
                                textAlign: TextAlign.right,
                                maxLines: 3,
                                minFontSize: 13,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 100,
                              height: 35,
                              decoration: BoxDecoration(
                                  //     border: Border.all(width: 1,color: Colors.blue)
                                  ),
                              child: Text(
                                'العنوان',
                                style: widget._stylePagesTitle,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    _Time(widget.myDruge.mapPharmacy[0]
                                        ['EndWork']),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontFamily: ArabicFonts.Cairo,
                                      package: 'google_fonts_arabic',
                                      letterSpacing: 1,
                                    ), //widget._stylePagesSubTitle,
                                    textAlign: TextAlign.right,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    m ? s1 : s2,
                                    style: widget._stylePagesSubTitle,
                                  ),

                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),

                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    _Time(widget.myDruge.mapPharmacy[0]
                                        ['BeginningWork']),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontFamily: ArabicFonts.Cairo,
                                      package: 'google_fonts_arabic',
                                      letterSpacing: 1,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    m ? s1 : s2,
                                    style: widget._stylePagesSubTitle,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('_',style: widget._stylePagesTitle,),
                                  SizedBox(
                                    width: 2,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 110,
                              height: 35,

                              decoration: BoxDecoration(
                                  // border: Border.all(width: 1,color: Colors.blue)
                                  ),
                              // height: 49,
                              child: Text(
                                'اوقات الدوام',
                                style: widget._stylePagesTitle,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                _launchCall(
                                    '${widget.myDruge.mapPharmacy[0]['Phone']}');
                              },
                              child: Text(
                                '${widget.myDruge.mapPharmacy[0]['Phone']}',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  //.fromRGBO(0, 0, 0, 10),
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                  letterSpacing: 1,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 100,
                              height: 35,
                              child: Text(
                                'الهاتف',
                                style: widget._stylePagesTitle,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 240,
                    width: double.infinity,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 10, left: 10, bottom: 5),
                      child: Carousel(
//                        defaultImage:
                        //Center(child: CircularProgressIndicator()),

                        images: [
                          Image.network('${widget.myDruge.imgDrug}'),
                          Image.network('${widget.myDruge.imgPharmacy}'),
                        ],
                        boxFit: BoxFit.contain,
                        autoplay: false,
                        dotSize: 4,
                        dotColor: Colors.red,
                        indicatorBgPadding: 2,
                        dotBgColor: Colors.transparent,
                        animationCurve: Curves.fastOutSlowIn,
                        animationDuration: Duration(milliseconds: 5000),

                        dotPosition: DotPosition.bottomCenter,
                        dotVerticalPadding: 10.0,
                        showIndicator: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
