import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

import 'Screens/HomePages.dart';

class momo extends StatefulWidget {
  @override
  _momoState createState() => _momoState();
}

class _momoState extends State<momo> with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  int state = 0;
  Animation _animation;
  double width = double.infinity;
  GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    ProgressDialog pr;
    pr = new ProgressDialog(context,type: ProgressDialogType.Normal);

   // pr.style(message: 'Showing some progress...');
    //Optional
    pr.style(
      message: 'انتظر من فضلك',
//      borderRadius: 10.0,
//      backgroundColor: Colors.white,
      progressWidget: HeartbeatProgressIndicator(
        child: Icon(Icons.favorite,
          color: Colors.red,),
      ),
//      elevation: 10.0,
//      insetAnimCurve: Curves.easeInOut,
//      progressTextStyle: TextStyle(
//          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
//      messageTextStyle: TextStyle(
//          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );
    return SplashScreen(

      title: new Text(
        'Welcome In SplashScreen',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      seconds:15,
      navigateAfterSeconds: HomePages(),
//      image: new Image.asset(
//          'assets/loading.gif'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 150.0,
      onClick: () => print("Flutter Egypt"),
      loaderColor: Colors.red,

    /*
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              child: LayoutBuilder(
                builder: (context, _) {
                  return IconButton(
                    icon: Icon(Icons.play_circle_filled),
                    iconSize: 50.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => HomePages(),
                          fullscreenDialog: true,
                        ),
                      );
                    },
                  );
                },
              ),
              alignment: Alignment.bottomCenter,
            ),
            Positioned.fill(
              child: Center(
                child: SpinKitFadingCircle(
                  itemBuilder: (_, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven ? Colors.red : Colors.green,
                      ),
                    );
                  },
                  size: 120.0,
                ),
              ),
            ),
          ],
        ),
      ),

      Center(
        child: RaisedButton(
            child: Text(
              'Show Dialog',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              pr.show();

              Future.delayed(Duration(milliseconds: 3000)).then((onValue){
//                print("PR status  ${pr.isShowing()}" );
//                if(pr.isShowing())
//                  pr.hide();
//                print("PR status  ${pr.isShowing()}" );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // _updateSeen();
                      return HomePages();
                    },
                  ),
                );

              });

            }),
      ),

           */
    );

  }
/*
    print(Offset(0.0, -1.0).distanceSquared - Offset(0.0, 0.0).distanceSquared);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('widget.title'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Jumping dots'),
            JumpingDotsProgressIndicator(
              fontSize: 20.0,
            ),
            SizedBox(height: 60.0),
            new Text('Heartbeat'),
            SizedBox(height: 16.0),
            HeartbeatProgressIndicator(duration: Duration(milliseconds: 1000),
              child: Icon(Icons.favorite,
                color: Colors.red,),
            ),
            SizedBox(height: 60.0),
            new Text('Glowing'),
            GlowingProgressIndicator(
              child: Icon(Icons.home),
            ),
            SizedBox(height: 32.0),
            FadingText('Loading...'),
            SizedBox(height: 32.0),
            JumpingText('Loading...'),
            SizedBox(height: 32.0),
            ScalingText('Loading...'),
            SizedBox(height: 32.0),
            CollectionSlideTransition(
              children: <Widget>[
                Icon(Icons.android),
                Icon(Icons.apps),
                Icon(Icons.announcement),
              ],
            ),
            SizedBox(height: 32.0),
            CollectionScaleTransition(
              children: <Widget>[
                Icon(Icons.android),
                Icon(Icons.apps),
                Icon(Icons.announcement),
              ],
            ),
          ],
        ),
      ),
    );
  }

 */

/*
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: PhysicalModel(
          color: Colors.lightBlue,
          elevation: _isPressed ? 5 : 4,
          borderRadius: BorderRadius.circular(50),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            key: _globalKey,
            height: 48,
            width: width,
            child: RaisedButton(
              padding: EdgeInsets.all(0),
              color: Colors.blue,
              child: buildButton(),
              onPressed: () {
                Timer(Duration(milliseconds: 2500), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        // _updateSeen();
                        return HomePages();
                      },
                    ),
                  );
                  setState(() {
                    state=1;
                  });
                });
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
    );

     */
  }
/*
  void animateButtom() {
    double initialWidth = _globalKey.currentContext.size.width;

    var controler =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(controler)
      ..addListener(() {
        setState(() {
          width = initialWidth - ((initialWidth - 48.0) * _animation.value);
        });
      });
    controler.forward();
    setState(() {
      state = 1;
    });
    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        state = 2;
      });
    });
  }

  Widget buildButton() {
    if (state == 0) {
      return Text(
        "Login",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      );
    } else if (state == 1) {
      return SizedBox(
        width: 36,
        height: 36,
        child: CircularProgressIndicator(
          value: null,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return Icon(
        Icons.check,
        color: Colors.white,
      );
    }
  }


}
*/