import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts_arabic/fonts.dart';

import '../Signup.dart';

class form_card_login extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    TextEditingController uesr=new TextEditingController();
    TextEditingController pass=new TextEditingController();
    return new Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(625),
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
          ]
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text("تسجيل دخول", style: t
                    /*TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(45),
                        fontFamily: "Poppins-Bold",
                        letterSpacing: .6)
                        */
                    ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                    Text("اسم المستخدم", style: t1
                        /*TextStyle(
                            fontFamily: "Poppins-Medium",
                            fontSize: ScreenUtil.getInstance().setSp(26)
                            )*/
                        ),
                  ],
                ),
                TextField(
controller: uesr,
                  decoration: InputDecoration(
                    hoverColor: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.lock,
                      color: Colors.blue,
                    ),
                    Text("الرمز السري", style: t1
                        /*TextStyle(
                            fontFamily: "Poppins-Medium",
                            fontSize: ScreenUtil.getInstance().setSp(26)
                            )*/
                        ),
                  ],
                ),
                TextField(
                  controller: pass,
                  //   obscureText: true,
                  decoration: InputDecoration(
                    hoverColor: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(35),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => SignUp(),
                          ),
                        );
                      },
                      child: InkWell(
                        onTap: (){},
                        child: Text("نسيت كلمة المرور ؟", style: t1
                            /*TextStyle(
                              color: Colors.blue,
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(28)),

                           */
                            ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
