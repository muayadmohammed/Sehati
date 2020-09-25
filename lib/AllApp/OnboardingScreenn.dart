import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:myproject/Screens/HomePages.dart';

class OnboardingScreenn extends StatelessWidget {
  static TextStyle _title = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
  );
  static TextStyle t1 = TextStyle(
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
    letterSpacing: 1,
  );
  static TextStyle t = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
    letterSpacing: 1,
  );

  //making list of pages needed to pass in IntroViewsFlutter constructor.

  @override
  Widget build(BuildContext context) {
    final pages = [
    PageViewModel(
        pageColor: const Color(0xFF03A9F4),
         iconImageAssetPath: 'assets/air-hostess.png',
        bubble: Image.asset('assets/images/pages/s1.png'),
        body: Text(
          'برنامج يقدم للمستخدم خدمات منها سرعة الوصول'
          ' والكلفة الاقل وتوفير الوقت على المستخدم',
        ),
        title: Text(
          'البرنامج',
        ),
        titleTextStyle: _title,
        //(fontFamily: 'MyFont', color: Colors.white),
        bodyTextStyle: t1,
        //TextStyle(fontFamily: 'MyFont', color: Colors.white),
        mainImage: Image.network(
          'assets/images/pages/s1.png',
          alignment: Alignment.center,
        )),
      PageViewModel(
        pageColor: const Color(0xFF8BC34A),
        iconImageAssetPath: 'assets/images/onboarding/drug.png',
        body: Text(
          'قسم تستطيع البحث فيه عن اي علاج وسوف يظهر العلاج بكل الصيدليات والمذاخر الموجود بها',
        ),
        title: Text('الادوية'),
        mainImage: Image.asset(
          'assets/images/onboarding/drug.png',
          alignment: Alignment.center,
        ),
        titleTextStyle: _title,
        //(fontFamily: 'MyFont', color: Colors.white),
        bodyTextStyle: t1, //TextStyle(fontFamily: 'MyFont', color: Colors.white),
      ),
      PageViewModel(
        pageColor: const Color(0xFF607D8B),
        iconImageAssetPath: 'assets/images/onboarding/makup2.png',
        body: Text(
          'يختص بكل ما يخص مواد التجميل والعناية بالبشرة وعناوين المراكز المتواجدة بها',
        ),
        title: Text('مستحضرات التجميل'),
        mainImage: Image.asset(
          'assets/images/onboarding/makup2.png',
          alignment: Alignment.center,
        ),
        titleTextStyle: _title,
        //(fontFamily: 'MyFont', color: Colors.white),
        bodyTextStyle: t1, //TextStyle(fontFamily: 'MyFont', color: Colors.white),
      ),
      PageViewModel(
        pageColor: const Color(0xFF607D8B),
        iconImageAssetPath: 'assets/images/onboarding/p3.png',
        body: Text(
          'قسم يوجود به كل انواع الاجهزة الطبية والموفرة في الصيدليات او مراكز التجهيزات الطبية',
        ),
        title: Text('تجهيزات المختبرية والطبية'),
        mainImage: Image.asset(
          'assets/images/onboarding/p3.png',
          alignment: Alignment.center,
        ),
        titleTextStyle: _title,
        //(fontFamily: 'MyFont', color: Colors.white),
        bodyTextStyle: t1, //TextStyle(fontFamily: 'MyFont', color: Colors.white),
      ),
      PageViewModel(
        pageColor: const Color(0xFF607D8B),
        iconImageAssetPath: 'assets/images/onboarding/pharm.png',
        body: Text(
          'يقدم لك كل عناوين الصيدليات واوقات دوامها وهاتف الصيدلية الموجودة على التطبيق ',
        ),
        title: Text('عناوين الصيدليات'),
        mainImage: Image.asset(
          'assets/images/onboarding/pharm.png',
          alignment: Alignment.center,
        ),
        titleTextStyle: _title,
        //(fontFamily: 'MyFont', color: Colors.white),
        bodyTextStyle: t1, //TextStyle(fontFamily: 'MyFont', color: Colors.white),
      ),
      PageViewModel(
        pageColor: const Color(0xFF607D8B),
        iconImageAssetPath: 'assets/images/onboarding/doctor.png',
        body: Text(
          'يوفر هذا القسم عناوين وعيادات الاطباء وكذلك اختصاص كل طبيب وايضا ارقام هواتف الحجز وغيرها',
        ),
        title: Text('عيادات الاطباء'),
        mainImage: Image.asset(
          'assets/images/onboarding/doctor.png',
          alignment: Alignment.center,
        ),
        titleTextStyle: _title,
        //(fontFamily: 'MyFont', color: Colors.white),
        bodyTextStyle: t1, //TextStyle(fontFamily: 'MyFont', color: Colors.white),
      ),
      PageViewModel(
        pageColor: const Color(0xFF607D8B),
        iconImageAssetPath: 'assets/images/onboarding/lab4.png',
        body: Text(
          'يوفر عناوين وواختصاص كل مختبر وارقام الهواتف وايام دوام المختبر وغيرها',
        ),
        title: Text('المختبرات'),
        mainImage: Image.asset(
          'assets/images/onboarding/lab4.png',
          alignment: Alignment.center,
        ),
        titleTextStyle: _title,
        //(fontFamily: 'MyFont', color: Colors.white),
        bodyTextStyle: t1, //TextStyle(fontFamily: 'MyFont', color: Colors.white),
      ),
    ];
    return Scaffold(
      body:IntroViewsFlutter(
        pages,

        doneText: FloatingActionButton(
          child: Text(
            'ابدء',
            style: t,//TextStyle(fontSize: 30, color: Colors.white),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePages(),
              ), //MaterialPageRoute
            );
          },
          backgroundColor: Colors.black,
          elevation: 20,
        ),
        skipText: FloatingActionButton(
          child: Text(
            'ابدء',
            style: t,//TextStyle(fontSize: 30, color: Colors.white),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePages(),
              ), //MaterialPageRoute
            );
          },
          backgroundColor: Colors.black,
          elevation: 20,
        ),
        showNextButton: false,
        showBackButton: false,
        showSkipButton: true,
        doneButtonPersist: false,
        columnMainAxisAlignment: MainAxisAlignment.center,

//          onTapDoneButton: () {
//            Navigator.push(
//              context,
//              MaterialPageRoute(
//                builder: (context) => HomePage(),
//              ), //MaterialPageRoute
//            );
//          },
        pageButtonTextStyles: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
      //Builder
    ); //Material App
  }
}
