
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:myproject/Screens/HomePages.dart';
import 'Signup.dart';
import 'package:http/http.dart'as http;





class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
  TextEditingController uesr=new TextEditingController();
  TextEditingController pass=new TextEditingController();

 
  TextStyle t3 = TextStyle(
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
  TextStyle t13 = TextStyle(
    fontSize: 15,
    color: Color(0XFF707070),
    fontWeight: FontWeight.w600,
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
    letterSpacing: 1,
  );


Future<List> _login() async{
  final respons=await http.post("http://192.168.0.103/Login Flutter/index.php",body: {
    "username":uesr.text,
    "password":pass.text,
  });

var datauser=json.decode(respons.body);
if(datauser.length==0){
  throw 'Login Fail';
}else{
  if(datauser[0]['level']=='admin'){

    //  print('${datauser[0]['level']}');
    Navigator.pushReplacementNamed(context, '/Admin');
  }else   if(datauser[0]['level']=='member'){

    //print('${datauser[0]['level']}');
    Navigator.pushReplacementNamed(context, '/Member');
  }
}
}
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
//                  Row(
//                    children: <Widget>[
//                      Image.asset(
//                        "assets/images/pages/logo.png",
//                        width: ScreenUtil.getInstance().setWidth(110),
//                        height: ScreenUtil.getInstance().setHeight(110),
//                      ),
//                      Text("LOGO",
//                          style: t
//                          /*TextStyle(
//                              fontFamily: "Poppins-Bold",
//                              fontSize: ScreenUtil.getInstance().setSp(46),
//                              letterSpacing: .6,
//                              fontWeight: FontWeight.bold)
//                            */
//                          )
//
//                    ],
//                  ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(200),
                    ),
                    Container(
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
                    ),
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
////                                    MaterialPageRoute(
////                                      builder: (BuildContext context) =>
////                                          HomePages(),
////                                    ),
////                                  );
                                _login();
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
                      height: ScreenUtil.getInstance().setHeight(20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("تسجيل بأستخدام",
                            style: t1
                            /*TextStyle(
                                fontSize: 16.0, fontFamily: "Poppins-Medium")
                                */ ),

                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: (){},
                          child: Image(image: ExactAssetImage('assets/images/login/f.png'),
                            width:45,height: 45,fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: (){},
                          child: Image(image: ExactAssetImage('assets/images/login/li.png'),
                            width:45,height: 45,fit: BoxFit.cover,
                          ),
                        ), SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: (){},
                          child: Image(image: ExactAssetImage('assets/images/login/g.png'),
                            width:45,height: 45,fit: BoxFit.cover,
                          ),
                        )
//                      SocialIcon(
//                        colors: [
//                          Color(0xFF102397),
//                          Color(0xFF187adf),
//                          Color(0xFF00eaf8),
//                        ],
//                        iconData: CustomIcons.facebook,
//
//                        onPressed: () {},
//                      ),
//                      SocialIcon(
//                        colors: [
//                          Color(0xFFff4f38),
//                          Color(0xFFff355d),
//                        ],
//                        iconData: CustomIcons.googlePlus,
//                        onPressed: () {},
//                      ),
//                      SocialIcon(
//                        colors: [
//                          Color(0xFF17ead9),
//                          Color(0xFF6078ea),
//                        ],
//                        iconData: CustomIcons.twitter,
//                        onPressed: () {},
//                      ),
//                      SocialIcon(
//                        colors: [
//                          Color(0xFF00c6fb),
//                          Color(0xFF005bea),
//                        ],
//                        iconData: CustomIcons.linkedin,
//                        onPressed: () {},
//                      )
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => SignUp(),
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


