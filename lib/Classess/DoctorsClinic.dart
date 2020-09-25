class DoctorsClinic {
  String DoctorsName;
  String DoctorSpecific;
  String EndWork;
  String BeginningWork;
  String ClinicAddress;
  String ClinicPhone;
  String Governorate;
  String imag_url;

  static String _path='http://192.168.0.107/pharm/images/DoctorsClinics/';
  // static String _path='http://muayad.aba.vg/images/DoctorsClinics/';
  DoctorsClinic(Map map) {
    this.DoctorsName=map['DoctorsName'];
    this.DoctorSpecific=map['DoctorSpecific'];
    this.EndWork=map['EndWork'];
    this.BeginningWork=map['BeginningWork'];
    this.ClinicAddress=map['ClinicAddress'];
    this.ClinicPhone=map['ClinicPhone'];
    this.Governorate=map['Governorate'];
    this.imag_url=_path+map['imag_url'];
  }
}