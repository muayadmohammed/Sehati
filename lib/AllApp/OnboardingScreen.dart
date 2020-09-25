import 'dart:async';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  bool _isInAsyncCall = false;
  bool _isPressed = false;
  int state = 0;
  Animation _animation;
  double width = double.infinity;
  GlobalKey _globalKey = GlobalKey();

  final int _numPages = 7;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.red, //Color(0xFF7B51D3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

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
  TextStyle t = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
    letterSpacing: 1,
  );
 final String _url='http://192.168.0.107/pharm/images/AllProject/';
 // final String _url='http://muayad.aba.vg/images/AllProject/';
  //  final String _url='http://sehatisehati.000webhostapp.com/images/AllProject/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
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
          child: ListView(
            children: <Widget>[
              
              Container(
                height: 600,
              //  width: double.infinity,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                  
                    _pages(
                        'البرنامج',
                        'برنامج يقدم للمستخدم خدمات منها سرعة الوصول'
                            ' والكلفة الاقل وتوفير الوقت على المستخدم',
                        _url+'111.png',
                       ),
                    _pages(
                        'الادوية',
                        'قسم تستطيع البحث فيه عن اي علاج وسوف يظهر العلاج بكل الصيدليات والمذاخر الموجود بها',
                        _url+'on.png',
                       ),
                    _pages(
                        'مستحضرات التجميل',
                        'يختص بكل ما يخص مواد التجميل والعناية بالبشرة وعناوين المراكز المتواجدة بها',
                        _url+'/2.png',
                     ),
                    _pages(
                        'تجهيزات المختبرية والطبية',
                        'قسم يوجود به كل انواع الاجهزة الطبية والموفرة في الصيدليات او مراكز التجهيزات الطبية',
                      _url+'3.png',
                        ),
                    _pages(
                        'المستشفيات',
                        'يقدم لك كل عناوين المسشفيات وهواتف الاسعاف الخاصة وعناوين المراكز الصحية الموجودة على التطبيق ',
                      _url+'4.png',
                       ),
                    _pages(
                        'عيادات الاطباء',
                        'يوفر هذا القسم عناوين وعيادات الاطباء وكذلك اختصاص كل طبيب وايضا ارقام هواتف الحجز وغيرها',
                      _url+'6.png',
                      ),
                    _pages(
                        'المختبرات',
                        'يوفر عناوين واختصاص كل مختبر وارقام الهواتف وايام دوام المختبر وغيرها',
                      _url+'5.png',
                      ),
                  ],
                ),
              ),
            
            
            
            ],
          ),
        ),
      ),
     floatingActionButton:Column(
       mainAxisAlignment:MainAxisAlignment.end,
       children: <Widget>[
         Padding(
           padding: const EdgeInsets.only(top: 50),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: _buildPageIndicator(),
           ),
         ),
         SizedBox(
           height: 15,
         ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 70),
           child: PhysicalModel(
             color: Colors.white,
             elevation: _isPressed ? 10 : 10,
             borderRadius: const BorderRadius.all(
               Radius.circular(18.0),
             ),
             child: Container(
               key: _globalKey,
               height: 60,
               width: 220,
               child: FlatButton(
                 // elevation: 10,
                 shape: RoundedRectangleBorder(
                   borderRadius: const BorderRadius.all(
                     Radius.circular(18.0),
                   ),
                 ),

                 color: state == 2 ? Colors.blue : Colors.white,
                 child: buildButton(),
                 onPressed: () {
                   Timer(Duration(milliseconds: 500), () {

                     _updateSeen();
                     Navigator.pushReplacementNamed(context, '/HomePages');

                   }
                   );

                 },
                 onHighlightChanged: (isPressed) {
                   setState(() {
                     _isPressed = isPressed;
                     if (state == 0) {
                       animateButtom();
                     }
                   });
                 },
               ),
             ),
           ),
         ),

       ],
     ),

    );
  }

  void animateButtom() {
    double initialWidth = _globalKey.currentContext.size.width;
    var controler =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(controler)
      ..addListener(() {
        setState(() {
          width = initialWidth - ((initialWidth - 32.0) * _animation.value);
        });
      });
    controler.forward();
    setState(() {
      state = 1;
    });
    Timer(Duration(seconds:1), () {
      setState(() {
        state = 2;
      });
    });
  }

  Widget buildButton() {
    if (state == 0) {
      return Text('أبــدء', style: t);
    } else if (state == 1) {
      return SizedBox(
        width: 36,
        height: 36,
        child: CircularProgressIndicator(
          value: null,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      );
    } else {
      return Icon(
        Icons.check,
        color: Colors.white,
      );
    }
  }

  Widget _pages(String _tittle, String _subTitle, String _image) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Center(
            child: DelayedDisplay(
              delay: Duration(milliseconds: 500),
              child: Text(
                _tittle,
                style: _title,
                textAlign: TextAlign.center,
              ),
            ),
          ),

          SizedBox(
            height: 15,
          ),
          Center(
            child: DelayedDisplay(
              delay: Duration(milliseconds: 750),
              child: Image.network(
                _image,
                height: 250,
               // width: 220,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 45.0),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DelayedDisplay(
                  delay: Duration(milliseconds:850),
                  child: Text(
                    _subTitle,
                    style: t1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _logo(String _tittle, String _subTitle, String _image) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 15,
          ),    Center(
            child: DelayedDisplay(
              delay: Duration(milliseconds: 500),
              child: Text(
                _tittle,
                style: _title,
              ),
            ),
          ),

          SizedBox(
            height: 15,
          ),
          Center(
            child: DelayedDisplay(
              delay: Duration(milliseconds: 700),
              child: Image.asset(
                _image,
                fit: BoxFit.cover,
                height: 250,
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DelayedDisplay(
                  delay: Duration(milliseconds: 850),
                  child: Text(
                    _subTitle,
                    style: t1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _updateSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }
}
