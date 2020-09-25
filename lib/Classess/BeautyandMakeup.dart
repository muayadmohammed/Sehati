class BeautyandMakeup {
  String id;
  String Price;
  String ProductionDate;
  String ExpirDate;
  String Description;
  List mapCenter;
  List mapMakeup;
  String imgMakeup;
  String imgCenter;

  static String _path='http://192.168.0.107/pharm/images/Cosmetics/';
   //static String _path='http://muayad.aba.vg/images/Cosmetics/';
  BeautyandMakeup(Map m) {
    this.id=m['ID'];
    this.Price=m['Price'];
    this.ProductionDate=m['ProductionDate'];
    this.ExpirDate=m ['ExpirDate'];
    this.Description=m['Description'];
    this.mapCenter=m['CenterID'];
    this.mapMakeup=m['MakeupID'];
    this.imgMakeup=_path+'Itmes/'+'${m['MakeupID'][0]['imag_url']}';
    this.imgCenter=_path+'Centers/'+'${m['CenterID'][0]['imag_url']}';

  }
}
