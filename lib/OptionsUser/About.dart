import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:myproject/AllApp/NavigationDrawer.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  TextStyle _title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
  );
  TextStyle t = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Color(0XFF2699FB),
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
    letterSpacing: 1,
  );
  TextStyle t1 = TextStyle(
    fontSize: 15,
    color: Color(0XFF707070),
    fontWeight: FontWeight.w600,
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
    letterSpacing: 1,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFF7FC4FD),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'عن البرنامج',
            style: _title,
          ),
          centerTitle: true,
        ),
        endDrawer: NavigationDrawer(),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(18.0),
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 17),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 5, left: 5, top: 20),
                      child: AutoSizeText(
                        'برنامج يعطي المستخدم العلاج او المستحضر او الجهاز وأيضا اسم أي مادة طبية '
                        'يوفر البرنامج الوقت والجهد لانه يعطي '
                        'المواطن الصيدلية التي توفر  العلاج او أي شيء طلبه'
                        ' وهو موجود في التطبيق ،،'
                        'وممكن يوفر أيضا الكلفة (مال أقل) لانه يعطي '
                        'تكلفة العلاج في كل صيدلة '
                        'يوجد فيها العلاج الذي طلبه',
                        textAlign: TextAlign.right,
                        style: t1,
                        maxLines: 7,
                        minFontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
