import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts_arabic/fonts.dart';

class FormCardSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    TextStyle t = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: Color(0XFF707070),
      fontFamily: ArabicFonts.Cairo,
      package: 'google_fonts_arabic',
      letterSpacing: 1,
    );
    TextStyle t1 = TextStyle(
      fontSize: 12.5,
      color: Color(0XFF707070),
      fontWeight: FontWeight.w600,
      fontFamily: ArabicFonts.Cairo,
      package: 'google_fonts_arabic',
      letterSpacing: 1,
    );

    return new Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(825),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top:  10.0),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text("تسجيل ",
                    style:t),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(40),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.person_outline,color: Colors.blue,),
                    Text("الاسم",
                        style:  t1),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                    hoverColor: Colors.blue,),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.email,color: Colors.blue,),
                    Text("الايميل",
                        style: t1),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                    hoverColor: Colors.blue,),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.lock_outline,color: Colors.blue,),
                    Text("الرمز",
                        style: t1),
                  ],
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hoverColor: Colors.blue,),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.lock_outline,color: Colors.blue,),
                    Text("تكرار الرمز",
                        style:t1),
                  ],
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hoverColor: Colors.blue,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
