import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:myproject/Screens/HomePages.dart';

class s1 extends StatefulWidget {
  @override
  _s1State createState() => _s1State();
}

class _s1State extends State<s1> {
  @override
  Widget build(BuildContext context) {
    TextStyle _title = TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.blue,
      fontFamily: ArabicFonts.Cairo,
      package: 'google_fonts_arabic',
    );
    TextStyle t1 = TextStyle(
      fontSize: 15,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: ArabicFonts.Cairo,
      package: 'google_fonts_arabic',
      letterSpacing: 1,
    );
    String s='momo';
    List<DropdownButton> d=[

    ];
    return Scaffold(

      appBar: AppBar(
        title: Text('s1'),
      ),
      body: Container(  decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.4, 0.7, 0.9],
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFAEE8FF),
            Color(0xFF8ECEFC),
            Color(0xFF03A0FF),
          ],
        ),
      ),
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

              DelayedDisplay(
                delay: Duration(seconds: 2),
                child: Image.asset( 'assets/images/pages/s1.png'),
                ),

              DelayedDisplay(
                delay: Duration(seconds: 3),
                child: Text(
                  'البرنامج',

                  style: _title,textAlign: TextAlign.center,
                ),
              ),
              DelayedDisplay(
                delay: Duration(seconds: 4),
                child: Text(

                  'برنامج يقدم للمستخدم خدمات منها سرعة الوصول'
                      ' والكلفة الاقل وتوفير الوقت على المستخدم',
                  style: t1,
                  textAlign: TextAlign.center,
                ),
              ),
                // DropdownButtonFormField(

                // ),
//                DropdownButton(items: d, onChanged: null)    ,
                FloatingActionButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => HomePages()));
                },heroTag: 'mo',
                  foregroundColor: Colors.yellow,

                child: Text('أبد'
                ,style: TextStyle(
                    fontSize: 20
                  )
                  ,textAlign: TextAlign.center,),
                ),
            ],
          ),
        ),
      ),






























//      body: Center(
//        child: Hero(
//          tag: 'a',
//          child: InkWell(
//            onTap: (){
//              Navigator.of(context).push(
//                MaterialPageRoute(
//                  builder: (BuildContext context) => s2(),
//                ),
//              );
//            },
//            child: Image.asset('assets/images/login/a.png'
//            ,
//              width: 300,
//              height: 100,
//            ),
//          ),
//        ),
//      ),
    );
  }
}
