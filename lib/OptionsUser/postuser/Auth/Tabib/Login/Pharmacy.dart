
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:myproject/OptionsUser/postuser/Auth/Pharmacy/Signup/Auth_tabib.dart';

import 'CardBody.dart';



class Parmacy extends StatefulWidget {
  @override
  _ParmacyState createState() => _ParmacyState();
}

class _ParmacyState extends State<Parmacy> {

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
  TextStyle t2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
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
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return SafeArea(
      child: new Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: true,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage('assets/images/login/a.png'),
                      fit: BoxFit.cover)),
            ),
//          Column(
//            crossAxisAlignment: CrossAxisAlignment.end,
//            children: <Widget>[
//              Padding(
//                padding: EdgeInsets.only(top: 20.0),
//
//                child: Image.asset("assets/image_01.png"),
//              ),
//              Expanded(
//                child: Container(),
//              ),
//              Image.asset("assets/image_02.png")
//            ],
//          ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 30.0),
                child: Column(
                  children: <Widget>[

                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(200),
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
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          null,
                                    ),
                                  );
                                },
                                child: Center(
                                  child: Text("تسجيل دخول",
                                      style: t2
                                    /*   TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Poppins-Bold",
                                          fontSize: 18,
                                          letterSpacing: 1.0)

                                    */
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(70),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => Tabib(),
                              ),
                            );
                          },
                          child: Text("تسجيل",
                              style: t1//TextStyle(color: Color(0xFF5d74e3),fontFamily: "Poppins-Bold")
                          ),
                        ),
                        Text(
                            "حساب جديد ؟",
                            style: t1//TextStyle(fontFamily: "Poppins-Medium"),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
