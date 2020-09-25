class Laboratories {
  String LabName;
  String LabSpecific;
  String WorkingHours;
  String beginningWorking;
  String LabAddress;
  String LabPhone;
  String Governorate;

  String imge_url;
 static String _path='http://192.168.0.107/pharm/images/Laboratories/';
   // static String _path='http://muayad.aba.vg/images/Laboratories/';
  Laboratories(Map m) {
    this.LabName=m['LabName'];
    this.LabSpecific=m['LabSpecific'];
    this.WorkingHours=m['WorkingHours'];
    this.LabAddress=m['LabAddress'];
    this.LabPhone=m['LabPhone'];
    this.Governorate=m['Governorate'];
    this.beginningWorking=m['beginningWorking'];
    this.imge_url=_path+m['imag_url'];
  }
}
