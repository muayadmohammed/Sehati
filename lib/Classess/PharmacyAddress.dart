class PharmacyAddres {
  String PharmacyName;
  String BeginningWork;
  String EndWork;
  String Address;
  String Phone;
  String Governorate;

  String imag_url;
 static String _path='http://192.168.0.108/pharm/images/';
 //   static String _path='http://muayad.aba.vg/images/';
  PharmacyAddres(Map m) {
    this.PharmacyName = m['PharmacyName'];
    this.Address = m['Address'];
    this.Phone = m['Phone'];
    this.Governorate = m['Governorate'];
    this.BeginningWork = m['BeginningWork'];
    this.EndWork = m['EndWork'];
    this.imag_url=_path+m['imag_url'];
  }
}
