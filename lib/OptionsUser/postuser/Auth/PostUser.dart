import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';


class PostUser extends StatefulWidget {
  @override
  _PostUserState createState() => _PostUserState();
}

class _PostUserState extends State<PostUser> {

  void _launchUrl(String Url) async{
    if(await canLaunch(Url)){
      await launch(Url);
    }else
    {
      Toast.show("!! غير موجود  ", context);
    }
  }
  void _launchCall(String number)async{
    var _number="tel:$number";
    _launchUrl(_number);
  }
  void _launchEmail(String email)async{
    var _email="mailto:$email";
    _launchUrl(_email);
  }


  @override

  TextStyle _text_HomePages = TextStyle(
      fontFamily: ArabicFonts.Cairo,
      package: 'google_fonts_arabic',
      letterSpacing: 1,
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontSize: 16);

  Widget build(BuildContext context) {
    TextStyle _contact = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: Colors.blue,
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
  );

  return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
           Image.network(
                'http://muayad.aba.vg/images/AllProject/s1.png',
 //               'http://192.168.0.108/images/AllProject/s1.png',
              ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AutoSizeText(
                'ان كنت صاحب عيادة او مختبر او مركز تجميل او صيدلية او مذخر او اجهزة طبية'

                    '\n'
                'يمكنك عن طريق تطبيقنا الاعلان وجعل وصول المستخدمين '
                'الى خدمتك اسهل ',
                style: _text_HomePages,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              ': يرجى التواصل معنا عبر'
              '\n''\n'
                  ' البريد الالكتروني '

              ,
              style: _text_HomePages,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
             InkWell(
               onTap: (){_launchEmail("muayadmohammed3@gmail.com");},
               child: Text(
                   'muayadmohmmed3@gmail.com',
                 style: _contact,
                 textAlign: TextAlign.center,
               ),
             ),
             SizedBox(
              height: 15,
            ),

            Text(
                ': او اتصل على ',
                style: _text_HomePages,
                textAlign: TextAlign.center,
              ),

            InkWell(
              onTap: (){
                _launchCall("07712218579");
              },
              child: AutoSizeText(
                '07712218579',
                style: _contact,
                textAlign: TextAlign.center,
              ),
            ),
            InkWell(
              onTap:(){
               _launchCall('07808816034');
                } ,
              child: AutoSizeText(
                '07808816034',
                style: _contact,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
