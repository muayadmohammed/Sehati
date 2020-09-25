import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:myproject/AllApp/NavigationDrawer.dart';

class Ab extends StatefulWidget {
  @override
  _AbState createState() => _AbState();
}

class _AbState extends State<Ab> {
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
        backgroundColor: Colors.white, //(0XFF7FC4FD),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'من نحن',
            style: _title,
          ),
          centerTitle: true,
        ),
        endDrawer: NavigationDrawer(),
        body: Material(
          elevation: 20,
          child: Center(
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(18.0),
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: AutoSizeText(
                          ' طالب طايح حظه من قسم لا هو هندسة'
                          '\n'
                              ' ولا هو علوم'

                              ' والطامة الكبرى حتى قسم ما عدنا',
                          textAlign: TextAlign.center,
                          style: t1,
                          maxLines: 7,
                          minFontSize: 13,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 110, left: 15),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            Text(
                              '  للضحك فقط',
                              style: t1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
