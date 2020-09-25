import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:myproject/OptionsUser/Ab.dart';
import 'package:myproject/OptionsUser/About.dart';
import 'package:myproject/OptionsUser/Feedback.dart';
import 'package:myproject/OptionsUser/postuser/Auth/PostUser.dart';
import 'package:myproject/Screens/HomePages.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {


  @override
  Widget build(BuildContext context) {
    TextStyle _title = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: ArabicFonts.Cairo,
      package: 'google_fonts_arabic',
    );
    double _Sizebox = 12;

    return Padding(
      padding: const EdgeInsets.only(
        left: 90,
      ),
      child: Drawer(
        //  child: drawerItems,

        child: ListView(
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
              ),
              child: Image.network('http://192.168.0.107/pharm/images/AllProject/s1.png',fit: BoxFit.cover,),
             // child: Image.network('http://muayad.aba.vg/images/AllProject/s1.png',fit: BoxFit.cover,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Divider(
                    height: 0,
                    thickness: 0,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    height: _Sizebox,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => HomePages(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              //   border: Border.all(width: 1,color: Colors.blue)
                              ),
                          child: Text(
                            'الرئيسية',
                            style: _title,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _Sizebox,
                  ),
                  Divider(
                    height: 0,
                    thickness: 0,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    height: _Sizebox,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => PostUser(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              //   border: Border.all(width: 1,color: Colors.blue)
                              ),
                          child: Text(
                            'اعلن معنا',
                            style: _title,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _Sizebox,
                  ),
                  Divider(
                    height: 0,
                    thickness: 0,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    height: _Sizebox,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => FeedBack(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              //   border: Border.all(width: 1,color: Colors.blue)
                              ),
                          child: Text(
                            'اعطاء ردة فعل',
                            style: _title,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _Sizebox,
                  ),
                  Divider(
                    height: 0,
                    thickness: 0,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    height: _Sizebox,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => About(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              //   border: Border.all(width: 1,color: Colors.blue)
                              ),
                          child: Text(
                            'عن البرنامج',
                            style: _title,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _Sizebox,
                  ),
                  Divider(
                    height: 0,
                    thickness: 0,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    height: _Sizebox,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => Ab(),
                        ),
                      );
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                //   border: Border.all(width: 1,color: Colors.blue)
                                ),
                            child: Text(
                              'من نحن',
                              style: _title,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: _Sizebox,
                  ),
                  Divider(
                    height: 0,
                    thickness: 0,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    height: _Sizebox,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
