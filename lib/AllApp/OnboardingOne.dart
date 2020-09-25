import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myproject/AllApp/OnboardingScreen.dart';
import 'package:myproject/Screens/HomePages.dart';
import 'package:simple_animations/simple_animations.dart';

bool ch = false;

class FancyBackgroundApp extends StatefulWidget {
  static int num = 0;

  @override
  _FancyBackgroundAppState createState() => _FancyBackgroundAppState();
}

class _FancyBackgroundAppState extends State<FancyBackgroundApp> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: AnimatedBackground()),
        onBottom(AnimatedWave(
          height: 180,
          speed: 1.0,
        )),
        onBottom(AnimatedWave(
          height: 120,
          speed: 0.9,
          offset: pi,
        )),
        onBottom(AnimatedWave(
          height: 220,
          speed: 1.2,
          offset: pi / 2,
        )),
        Positioned.fill(child: CenteredText()),
      ],
    );
  }

  onBottom(Widget child) => Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      );
}

class AnimatedWave extends StatelessWidget {
  final double height;
  final double speed;
  final double offset;

  AnimatedWave({this.height, this.speed, this.offset = 0.0});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: height,
        width: constraints.biggest.width,
        child: ControlledAnimation(
            playback: Playback.LOOP,
            duration: Duration(milliseconds: (5000 / speed).round()),
            tween: Tween(begin: 0.0, end: 2 * pi),
            builder: (context, value) {
              return CustomPaint(
                foregroundPainter: CurvePainter(value + offset),
              );
            }),
      );
    });
  }
}

class CurvePainter extends CustomPainter {
  final double value;

  CurvePainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final white = Paint()..color = Colors.white.withAlpha(60);
    final path = Path();

    final y1 = sin(value);
    final y2 = sin(value + pi / 2);
    final y3 = sin(value + pi);

    final startPointY = size.height * (0.5 + 0.4 * y1);
    final controlPointY = size.height * (0.5 + 0.4 * y2);
    final endPointY = size.height * (0.5 + 0.4 * y3);

    path.moveTo(size.width * 0, startPointY);
    path.quadraticBezierTo(
        size.width * 0.5, controlPointY, size.width, endPointY);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class AnimatedBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("color1").add(Duration(seconds: 3),
          ColorTween(begin: Color(0xffD38312), end: Colors.lightBlue.shade900)),
      Track("color2").add(Duration(seconds: 3),
          ColorTween(begin: Color(0xffA83279), end: Colors.blue.shade600))
    ]);

    return ControlledAnimation(
      playback: Playback.MIRROR,
      tween: tween,
      duration: tween.duration,
      builder: (context, animation) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [animation["color1"], animation["color2"]])),
        );
      },
    );
  }
}

class CenteredText extends StatefulWidget {
  const CenteredText({
    Key key,
  }) : super(key: key);

  @override
  _CenteredTextState createState() => _CenteredTextState();
}

class _CenteredTextState extends State<CenteredText> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TypewriterText(
              "Powerd By",
              TextStyle(
                letterSpacing: 5,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              800),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TypewriterText(
                  "Muayad",
                  TextStyle(
                      letterSpacing: 5,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.lightBlueAccent),
                  2000),

              TypewriterText(
                  " Mohammed  ",
                  TextStyle(
                    letterSpacing: 5,
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  2900),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: GestureDetector(
                onTap: () {
                      Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                        return OnboardingScreen();
                      }));
                },
                child: TypewriterText(
                    "اضغط للبدء",
                    TextStyle(
                        letterSpacing: 5,
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    3500)),
          ),
        ],
      ),
    ));
  }
}

class TypewriterText extends StatefulWidget {
  static const TEXT_STYLE = TextStyle(
    letterSpacing: 5,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  TextStyle textStyle;
  final String text;
  var num;

  TypewriterText(this.text, this.textStyle, this.num);

  @override
  _TypewriterTextState createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
        duration: Duration(milliseconds: 900),
        delay: Duration(milliseconds: widget.num),
        tween: IntTween(begin: 0, end: widget.text.length),
        builder: (context, textLength) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.text.substring(0, textLength),
                      style: widget.textStyle),
                  ControlledAnimation(
                    playback: Playback.LOOP,
                    duration: Duration(milliseconds: 600),
                    tween: IntTween(begin: 0, end: 1),
                    builder: (context, oneOrZero) {
                      return Opacity(
                          opacity: oneOrZero == 1 ? 1.0 : 0.0,
                          child: Text("", style: widget.textStyle));
                    },
                  ),
                ],
              ),
            ],
          );
        });
  }
}
