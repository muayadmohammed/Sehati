import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

import 'Pharmacy/Login/Pharmacy.dart';



class ChooseOption extends StatefulWidget {
  @override
  _ChooseOptionState createState() => _ChooseOptionState();
}

class _ChooseOptionState extends State<ChooseOption> {
  @override
  TextStyle _Title = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
  );
  TextStyle _titl = TextStyle(
    fontSize: 25,
    letterSpacing: 1,
    fontWeight: FontWeight.bold,
    color: Colors.red,
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
  );
  TextStyle _titll = TextStyle(
    fontSize: 25,
    letterSpacing: 1,   fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
  );
  TextStyle _titlee = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
  );

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              //color: Colors.red,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF6078ea),
                  Color(0xFF17ead9),
                ]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: AutoSizeText(
                      'اذا كان لديك عيادة او مختبر او مكان صيدلية اضغط على دخول',
                      style: _Title,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: InkWell(
                      onTap: (){Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => Parmacy(),
                        ),);},
                      child: Container(
                        height: 60,
                        width: double.infinity,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          //border: Border.all(width: 2, color: Colors.teal),
                        ),
                        child: Center(
                            child: AutoSizeText(
                          'دخــــول',
                          style: _titl,
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: AutoSizeText(
                      'اذا كان لديك صيدلية او مركز تجميل او مسلزمات طبية اضغط على دخول',
                      style: _titlee,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: InkWell(
                      onTap:(){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => Parmacy(),
                          ),);
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,

                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [
                                Color(0xFF6078ea),
                                Color(0xFF17ead9),
                              ]),
                            ),
                            child: Center(
                                child: AutoSizeText(
                              'دخول',
                              style: _titll,
                            ))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
