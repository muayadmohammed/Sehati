class CentersandDevice {
  String id;
  String Price;
  List mapCenter;
  List mapDevice;

  String imgCenter;
  String imgDevice;
  static String _path='http://192.168.0.107/pharm/images/DevicesMedical/';
  //  static String _path='http://muayad.aba.vg/images/DevicesMedical/';

  CentersandDevice(Map m) {
    this.id=m['Id'];
    this.Price=m['Price'];
    this.mapCenter=m['CenterID'];
    this.mapDevice=m['DeviceID'];
    this.imgCenter =_path+'Centers/'+'${m['CenterID'][0]['imag_url']}';
    this.imgDevice =_path+'Itmes/'+
        '${m['DeviceID'][0]['imag_url']}';

  }
}
