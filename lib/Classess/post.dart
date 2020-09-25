import 'dart:convert';
import 'package:edge_alert/edge_alert.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myproject/Classess/CentersandDevice.dart';
import 'package:myproject/Classess/Hospital.dart';
import 'package:myproject/Classess/mydrugs.dart';
import 'BeautyandMakeup.dart';
import 'CentersandDevice.dart';
import 'DoctorsClinic.dart';
import 'Laboratories.dart';
import 'PharmacyAddress.dart';

class Post {
   //   static String path = 'http://muayad.aba.vg/';

 static String path = 'http://192.168.0.107/pharm/';

   // static String path = 'http://192.168.43.2/pharm/';

  static Future<List<MyDruge>> postDrugs(BuildContext context) async {
    List<MyDruge> listDrug = List<MyDruge>();
    http.Response response = await http.post(path + 'drugs.php');
    try {
      // print(response.statusCode);
      if (response.statusCode != 403) {
        if (response.statusCode == 200) {
          if (!response.body.contains("empty")) {
            var val = json.decode(response.body);

            for (int ii = 0; ii < val.length; ii++) {
              Map map = val[ii];
              MyDruge myDrugee = new MyDruge(map);
              listDrug.add(myDrugee);
              //  print(ii);
              // print(response.body);
            }
          } else {
            EdgeAlert.show(
              context,
              title: '',
              description: ' الادوية فارغة',
              gravity: EdgeAlert.TOP,
              backgroundColor: Colors.red,
              icon: Icons.error,
            );
          }
        } else if (response.statusCode == 404) {
          EdgeAlert.show(
            context,
            title: '',
            description: 'تحقق من الاتصال بالانترنت',
            gravity: EdgeAlert.TOP,
            backgroundColor: Colors.red,
            icon: Icons.error,
          );
        }
      } else {
        EdgeAlert.show(
          context,
          title: '',
          description: 'يرجى التحقق من اتصالك بالانترنت',
          gravity: EdgeAlert.TOP,
          backgroundColor: Colors.red,
          icon: Icons.error,
        );
      }
    } catch (e) {
      print(e);
    }
    return listDrug;
  }

  static Future<List<BeautyandMakeup>> postBeautyandMakeup(
      BuildContext context) async {
    List<BeautyandMakeup> listBeautyandMakeup = List<BeautyandMakeup>();
    http.Response response = await http.post(path + 'beautyandmakeup.php');
    try {
      if (response.statusCode == 200) {
        if (!response.body.contains("empty")) {
          var val = json.decode(response.body);

          for (int ii = 0; ii < val.length; ii++) {
            Map map = val[ii];
            BeautyandMakeup myBeautyandMakeup = new BeautyandMakeup(map);
            listBeautyandMakeup.add(myBeautyandMakeup);
          }
        } else {
          EdgeAlert.show(
            context,
            title: '',
            description: 'لاتوجد اي مستحضرات',
            gravity: EdgeAlert.TOP,
            backgroundColor: Colors.red,
            icon: Icons.error,
          );
        }
      } else if (response.statusCode == 404) {
        EdgeAlert.show(
          context,
          description: 'تحقق من الاتصال بالانترنت',
          gravity: EdgeAlert.TOP,
          backgroundColor: Colors.red,
          icon: Icons.error,
        );
      }
    } catch (e) {
      print(e);
    }
    return listBeautyandMakeup;
  }

  static Future<List<CentersandDevice>> postCentersandDevice(
      BuildContext context) async {
    List<CentersandDevice> listCentersandDevice = List<CentersandDevice>();
    http.Response response = await http.post(path + 'medicanddevice.php');
    try {
      if (response.statusCode == 200) {
        if (!response.body.contains("empty")) {
          var val = json.decode(response.body);

          for (int ii = 0; ii < val.length; ii++) {
            Map map = val[ii];
            CentersandDevice myCentersandDevice = new CentersandDevice(map);
            listCentersandDevice.add(myCentersandDevice);
            // print(listDrug[ii]);
          }
        } else {
          EdgeAlert.show(
            context,
            title: '',
            description: 'لاتوجد اي اجهزة',
            gravity: EdgeAlert.TOP,
            backgroundColor: Colors.red,
            icon: Icons.error,
          );
        }
      } else if (response.statusCode == 404) {
        EdgeAlert.show(
          context,
          title: '',
          description: 'تحقق من الاتصال بالانترنت',
          gravity: EdgeAlert.TOP,
          backgroundColor: Colors.red,
          icon: Icons.error,
        );
      }
    } catch (e) {
      print(e);
    }
    return listCentersandDevice;
  }

  static Future<List<PharmacyAddres>> postPharmacyAddres(
      BuildContext context) async {
    List<PharmacyAddres> listPharmacyAddress = List<PharmacyAddres>();
    http.Response response = await http.post(path + 'Pharmacy.php');
    try {
      if (response.statusCode == 200) {
        if (!response.body.contains("empty")) {
          var val = json.decode(response.body);

          for (int ii = 0; ii < val.length; ii++) {
            Map map = val[ii];
            PharmacyAddres myPharmacyAddress = new PharmacyAddres(map);
            listPharmacyAddress.add(myPharmacyAddress);
            // print(listDrug[ii]);
          }
        } else {
          EdgeAlert.show(
            context,
            title: '',
            description: 'لاتوجد اي صيدليات',
            gravity: EdgeAlert.TOP,
            backgroundColor: Colors.red,
            icon: Icons.error,
          );
        }
      } else if (response.statusCode == 404) {
        EdgeAlert.show(
          context,
          title: '',
          description: 'تحقق من الاتصال بالانترنت',
          gravity: EdgeAlert.TOP,
          backgroundColor: Colors.red,
          icon: Icons.error,
        );
      }
    } catch (e) {
      print(e);
    }
    return listPharmacyAddress;
  }

  static Future<List<Laboratories>> postLaboratories(
      BuildContext context) async {
    List<Laboratories> listLaboratories = List<Laboratories>();
    http.Response response = await http.post(path + 'Lab.php');
    try {
      if (response.statusCode == 200) {
        if (!response.body.contains("empty")) {
          var val = json.decode(response.body);

          for (int ii = 0; ii < val.length; ii++) {
            Map map = val[ii];
            Laboratories myLaboratories = new Laboratories(map);
            listLaboratories.add(myLaboratories);
            // print(listDrug[ii]);
          }
        } else {
          EdgeAlert.show(
            context,
            title: '',
            description: 'لاتوجد اي مختبرات',
            gravity: EdgeAlert.TOP,
            backgroundColor: Colors.red,
            icon: Icons.error,
          );
        }
      } else if (response.statusCode == 404) {
        EdgeAlert.show(
          context,
          title: '',
          description: 'تحقق من الاتصال بالانترنت',
          gravity: EdgeAlert.TOP,
          backgroundColor: Colors.red,
          icon: Icons.error,
        );
      }
    } catch (e) {
      print(e);
    }
    return listLaboratories;
  }

  static Future<List<DoctorsClinic>> postDoctorsClinic(
      BuildContext context) async {
    List<DoctorsClinic> listDoctorsClinic = List<DoctorsClinic>();
    http.Response response = await http.post(path + 'Clinic.php');
    try {
      if (response.statusCode == 200) {
        if (!response.body.contains("empty")) {
          var val = json.decode(response.body);
          for (int i = 0; i < val.length; i++) {
            Map map = val[i];
            DoctorsClinic myDoctorsClinic = new DoctorsClinic(map);
            listDoctorsClinic.add(myDoctorsClinic);
          }
        } else {
          EdgeAlert.show(
            context,
            title: '',
            description: 'لاتوجد اي عيادات',
            gravity: EdgeAlert.TOP,
            backgroundColor: Colors.red,
            icon: Icons.error,
          );
        }
      } else if (response.statusCode == 404) {
        EdgeAlert.show(
          context,
          title: '',
          description: 'تحقق من الاتصال1111 بالانترنت',
          gravity: EdgeAlert.TOP,
          backgroundColor: Colors.red,
          icon: Icons.error,
        );
      }
    } catch (e) {
      print(e);
    }

    return listDoctorsClinic;
  }

  static Future<List<Hospitall>> postHospital(BuildContext context) async {
    List<Hospitall> listHospital = List<Hospitall>();
    http.Response response = await http.post(path + 'Hospital.php');

    try {
      // print(response.statusCode);
      // print('object                        dddddddddddddddd             ');
      // print(response.body);
      if (response.statusCode == 200) {
        if (!response.body.contains("empty")) {
          var val = json.decode(response.body);
          for (int ii = 0; ii < val.length; ii++) {
            Map map = val[ii];
            Hospitall myHospital = new Hospitall(map);
            listHospital.add(myHospital);
            // print(listDrug[ii]);
          }
        } else {
          EdgeAlert.show(
            context,
            title: '',
            description: 'لاتوجد اي مستشفيات',
            gravity: EdgeAlert.TOP,
            backgroundColor: Colors.red,
            icon: Icons.error,
          );
        }
      } else if (response.statusCode == 404) {
        EdgeAlert.show(
          context,
          title: '',
          description: 'تحقق من الاتصال بالانترنت',
          gravity: EdgeAlert.TOP,
          backgroundColor: Colors.red,
          icon: Icons.error,
        );
      }
    } catch (e) {
      print(e);
    }

    return listHospital;
  }

//////////////////////////////////

  static Future<List<MyDruge>> FeachsearchDrugs(
      BuildContext context, String Drugsname) async {
    List<MyDruge> listsearchMyDruge = List<MyDruge>();
    http.Response response =
        await http.post(path + 'searchDrugs.php', body: {"name": Drugsname});
    try {
      // print(response.statusCode);
      // print('object                        dddddddddddddddd             ');
      // print(response.body);
      if (response.statusCode == 200) {
        if (!response.body.contains("empty")) {
          var val = json.decode(response.body);
          for (int ii = 0; ii < val.length; ii++) {
            Map map = val[ii];

            MyDruge mysearchDrugs = new MyDruge(map);

            listsearchMyDruge.add(mysearchDrugs);
          }
        } else {
          EdgeAlert.show(
            context,
            title: '',
            description: 'لايوجد دواء بهذا الاسم',
            gravity: EdgeAlert.TOP,
            backgroundColor: Colors.red,
            icon: Icons.error,
          );
        }
      } else if (response.statusCode == 404) {
        EdgeAlert.show(
          context,
          title: '',
          description: 'تحقق من الاتصال بالانترنت',
          gravity: EdgeAlert.TOP,
          backgroundColor: Colors.red,
          icon: Icons.error,
        );
      }
    } catch (e) {
      print(e);
    }
    return listsearchMyDruge;
  }

  static Future<List<BeautyandMakeup>> FeachsearchBeautyandMakeup(
      BuildContext context, String Makeupname) async {
    List<BeautyandMakeup> listsearchBeautyandmakeup = List<BeautyandMakeup>();
    http.Response response = await http
        .post(path + 'searchBeautyandMakeup.php', body: {"name": Makeupname});
    try {
      if (response.statusCode == 200) {
        // print("${response.body}");
        if (!response.body.contains("empty")) {
          var val = json.decode(response.body);
          for (int ii = 0; ii < val.length; ii++) {
            Map map = val[ii];
            BeautyandMakeup mysearchBeautyandmakeup = new BeautyandMakeup(map);
            listsearchBeautyandmakeup.add(mysearchBeautyandmakeup);
            print(listsearchBeautyandmakeup);
          }
        } else {
          EdgeAlert.show(
            context,
            title: '',
            description: 'لايوجد مستحضر بهذا الاسم',
            gravity: EdgeAlert.TOP,
            backgroundColor: Colors.red,
            icon: Icons.error,
          );
        }
      } else if (response.statusCode == 404) {
        EdgeAlert.show(
          context,
          title: '',
          description: 'تحقق من الاتصال بالانترنت',
          gravity: EdgeAlert.TOP,
          backgroundColor: Colors.red,
          icon: Icons.error,
        );
      }
    } catch (e) {
      print(e);
    }

    return listsearchBeautyandmakeup;
  }

  static Future<List<CentersandDevice>> FeachsearchCentersandDevice(
      BuildContext context, String CentersandDevic) async {
    List<CentersandDevice> listsearchCentersandDevice =
        List<CentersandDevice>();
    http.Response response = await http.post(
        path + 'searchMedicalandDevice.php',
        body: {"name": CentersandDevic});
    try {
      if (response.statusCode == 200) {
        print("${response.body}");
        if (!response.body.contains("empty")) {
          var val = json.decode(response.body);
          for (int ii = 0; ii < val.length; ii++) {
            Map map = val[ii];
            CentersandDevice mysearchCentersandDevice =
                new CentersandDevice(map);
            listsearchCentersandDevice.add(mysearchCentersandDevice);
            print(listsearchCentersandDevice);
          }
        } else {
          EdgeAlert.show(
            context,
            title: '',
            description: 'لايوجد مستحضر بهذا الاسم',
            gravity: EdgeAlert.TOP,
            backgroundColor: Colors.red,
            icon: Icons.error,
          );
        }
      } else if (response.statusCode == 404) {
        EdgeAlert.show(
          context,
          title: '',
          description: 'تحقق من الاتصال بالانترنت',
          gravity: EdgeAlert.TOP,
          backgroundColor: Colors.red,
          icon: Icons.error,
        );
      }
    } catch (e) {
      print(e);
    }

    return listsearchCentersandDevice;
  }

/////////////////////////////////////

  static Future<List<DoctorsClinic>> FeachsearchDoctor(
      BuildContext context, String nameDoctor) async {
    List<DoctorsClinic> listsearchDoctorsClinic = List<DoctorsClinic>();
    http.Response response =
        await http.post(path + 'searchDoctor.php', body: {"name": nameDoctor});
    try {
      if (response.statusCode == 200) {
        if (!response.body.contains("empty")) {
          var val = json.decode(response.body);
          for (int ii = 0; ii < val.length; ii++) {
            Map map = val[ii];

            DoctorsClinic mysearchDoctorsClinic = new DoctorsClinic(map);
            listsearchDoctorsClinic.add(mysearchDoctorsClinic);
          }
        } else {
          EdgeAlert.show(
            context,
            title: '',
            description: 'لايوجد طبيب بهذا الاسم',
            gravity: EdgeAlert.TOP,
            backgroundColor: Colors.red,
            icon: Icons.error,
          );
        }
      } else if (response.statusCode == 404) {
        EdgeAlert.show(
          context,
          title: '',
          description: 'تحقق من الاتصال بالانترنت',
          gravity: EdgeAlert.TOP,
          backgroundColor: Colors.red,
          icon: Icons.error,
        );
      }
    } catch (e) {
      print(e);
    }
    return listsearchDoctorsClinic;
  }

  static Future<List<PharmacyAddres>> FeachsearchPharmacy(
      BuildContext context, String namePharmacy) async {
    List<PharmacyAddres> listsearchPharmacyAddres = List<PharmacyAddres>();
    http.Response response = await http
        .post(path + 'searchPharmacy.php', body: {"name": namePharmacy});
    try {
      if (response.statusCode == 200) {
        if (!response.body.contains("empty")) {
          var val = json.decode(response.body);
          for (int ii = 0; ii < val.length; ii++) {
            Map map = val[ii];
            PharmacyAddres mysearchPharmacyAddres = new PharmacyAddres(map);
            listsearchPharmacyAddres.add(mysearchPharmacyAddres);
          }
        } else {
          EdgeAlert.show(
            context,
            title: '',
            description: 'لاتوجد صيدلية بهذا الاسم',
            gravity: EdgeAlert.TOP,
            backgroundColor: Colors.red,
            icon: Icons.error,
          );
        }
      } else if (response.statusCode == 404) {
        EdgeAlert.show(
          context,
          title: '',
          description: 'تحقق من الاتصال بالانترنت',
          gravity: EdgeAlert.TOP,
          backgroundColor: Colors.red,
          icon: Icons.error,
        );
      }
    } catch (e) {
      print(e);
    }
    return listsearchPharmacyAddres;
  }

  static Future<List<Laboratories>> FeachsearchLab(
      BuildContext context, String nameLaboratorie) async {
    List<Laboratories> listsearchLaboratories = List<Laboratories>();
    http.Response response = await http
        .post(path + 'searchlab.php', body: {"name": nameLaboratorie});
    try {
      if (response.statusCode == 200) {
        if (!response.body.contains("empty")) {
          var val = json.decode(response.body);
          for (int ii = 0; ii < val.length; ii++) {
            Map map = val[ii];

            Laboratories mysearchLaboratories = new Laboratories(map);

            listsearchLaboratories.add(mysearchLaboratories);
          }
        } else {
          EdgeAlert.show(
            context,
            title: '',
            description: 'لاتوجد مختبر بهذا الاسم',
            gravity: EdgeAlert.TOP,
            backgroundColor: Colors.red,
            icon: Icons.error,
          );
        }
      } else if (response.statusCode == 404) {
        EdgeAlert.show(
          context,
          title: '',
          description: 'تحقق من الاتصال بالانترنت',
          gravity: EdgeAlert.TOP,
          backgroundColor: Colors.red,
          icon: Icons.error,
        );
      }
    } catch (e) {
      print(e);
    }
    return listsearchLaboratories;
  }

  static Future<List<Hospitall>> FeachsearchHospital(
      BuildContext context, String nameHospital) async {
    List<Hospitall> listsearchHospital = List<Hospitall>();
    http.Response response = await http
        .post(path + 'searchhospital.php', body: {"name": nameHospital});
    try {
      if (response.statusCode == 200) {
        if (!response.body.contains("empty")) {
          var val = json.decode(response.body);
          for (int ii = 0; ii < val.length; ii++) {
            Map map = val[ii];

            Hospitall mysearchHospital = new Hospitall(map);

            listsearchHospital.add(mysearchHospital);
          }
        } else {
          EdgeAlert.show(
            context,
            title: '',
            description: 'لاتوجد مختبر بهذا الاسم',
            gravity: EdgeAlert.TOP,
            backgroundColor: Colors.red,
            icon: Icons.error,
          );
        }
      } else if (response.statusCode == 404) {
        EdgeAlert.show(
          context,
          title: '',
          description: 'تحقق من الاتصال بالانترنت',
          gravity: EdgeAlert.TOP,
          backgroundColor: Colors.red,
          icon: Icons.error,
        );
      }
    } catch (e) {
      print(e);
    }
    return listsearchHospital;
  }
}