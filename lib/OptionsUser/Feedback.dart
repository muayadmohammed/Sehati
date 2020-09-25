import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:myproject/AllApp/NavigationDrawer.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  TextStyle _title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
  );
  TextStyle t1 = TextStyle(
    fontSize: 15,
    color: Color(0XFF707070),
    fontWeight: FontWeight.w600,
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
    letterSpacing: 1,
  );
  TextStyle t = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
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
            'ردة فعل',
            style: _title,
          ),
          centerTitle: true,
        ),
        endDrawer: NavigationDrawer(),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(18.0),
                  ),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 19, vertical: 50),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 19, vertical: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.person_outline,
                            color: Colors.blue,
                          ),
                          Text(
                            'الاسم الكامل',
                            style: t1,
                          ),
                        ],
                      ),
                      TextField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                            //hoverColor: Colors.blue,
                            ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.mail_outline,
                            color: Colors.blue,
                          ),
                          Text(
                            "البريد او رقم الهاتف",
                            style: t1,
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      TextField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.message,
                            color: Colors.blue,
                          ),
                          Text(
                            "أي رسالة او مشكلة",
                            style: t1,
                          ),
                        ],
                      ),
                      TextField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: MaterialButton(

                          height: 50,
                          minWidth: 200,
                          color: Colors.blue,
                          onPressed: () {

                             // print('  زراب زراب ');

                          },
                          textColor: Colors.white,
                          elevation:10,
                          child: Text('أرسال',
                          style: _title,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
