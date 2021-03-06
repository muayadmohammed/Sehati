import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts_arabic/fonts.dart';

import 'CardBody.dart';

class Tabib extends StatefulWidget {
  @override
  _TabibState createState() => _TabibState();
}

class _TabibState extends State<Tabib> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);

    TextStyle t2 = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: ArabicFonts.Cairo,
      package: 'google_fonts_arabic',
      letterSpacing: 1,
    );

    return SafeArea(
      child: new Scaffold(


        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: true,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF6078ea),
              Color(0xFF17ead9),
            ]),
            //  image: DecorationImage(image: ExactAssetImage('assets/images/login/a.png'),fit: BoxFit.cover,)
          ),

          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[

              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 40.0),
                  child: Column(
                    children: <Widget>[

                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(120),
                      ),
                      FormCard(),
                      SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          InkWell(
                            child: Container(
                              width: ScreenUtil.getInstance().setWidth(330),
                              height: ScreenUtil.getInstance().setHeight(100),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Color(0xFF17ead9),
                                    Color(0xFF6078ea)
                                  ]),
                                  borderRadius: BorderRadius.circular(6.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0xFF6078ea).withOpacity(.3),
                                        offset: Offset(0.0, 8.0),
                                        blurRadius: 8.0)
                                  ]),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
//                                  Navigator.of(context).push(
//                                    MaterialPageRoute(
//                                      builder: (BuildContext context) => null,
//                                    ),);
                                  },
                                  child: Center(
                                    child: Text(" دخول",
                                        style: t2),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
