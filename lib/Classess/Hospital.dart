class Hospitall {
  String HospitalName;
  String HospitalType;
  String Address;
  String Phone;
  String Governorate;
  String imag_url;

  static String _path='http://192.168.0.107/pharm/images/Hospitals/';
//   static String _path='http://muayad.aba.vg/images/Hospitals/';
  Hospitall(Map m) {
    this.HospitalName=m['HospitalName'];
    this.HospitalType=m['HospitalType'];
    this.Address=m['Address'];
    this.Phone=m['Phone'];
    this.Governorate=m['Governorate'];
    this.imag_url=_path+m['Imag_url'];
  }
}