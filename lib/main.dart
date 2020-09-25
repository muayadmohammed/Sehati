import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:myproject/AllApp/OnboardingScreen.dart';
import 'package:myproject/Screens/HomePages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 's2.dart';

main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool('seen');
  Widget _screen;
  var connectivityResult = await (Connectivity().checkConnectivity());
  print(connectivityResult);
//  if (connectivityResult == ConnectivityResult.none) {
//    print('no conaccted');
//    print(connectivityResult);
//    return FloatingActionButton(onPressed: ()async{
//
////        connectivityResult = await (Connectivity().checkConnectivity());
//        setState() {
//          connectivityResult;
//        }
//    });
//  } else //(connectivityResult == ConnectivityResult.wifi)
  {
    if (seen == null || seen == false) {
      _screen = OnboardingScreen();
    } else {
      _screen = HomePages();

    }

    runApp(MyApp(_screen));
  }
}

class MyApp extends StatelessWidget {
  final Widget _screen;

  MyApp(this._screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SEHATI',
     home: this._screen,
      //      home: SearchListExample(),
      routes: <String, WidgetBuilder>{
        '/HomePages': (BuildContext context) => new HomePages(),
      },
    );
  }
}