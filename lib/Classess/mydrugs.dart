class MyDruge {
  String id;
  String Price;
  String ProductionDate;
  String ExpirDate;
  List mapPharmacy;
  List mapDrugs;
  String imgPharmacy;
  String imgDrug;
  static String _path='http://192.168.0.107/pharm/images/Drugs/';
 // static String _path='http://muayad.aba.vg/images/Drugs/';

  MyDruge(Map m) {
    this.id = m['ID'];
    this.mapPharmacy = m['PharmacyID'];
    this.mapDrugs = m['DrugsID'];
    this.Price = m['Price'];
    this.ProductionDate = m['ProductionDate'];
    this.ExpirDate = m['ExpirDate'];
    this.imgPharmacy =_path+'Pharmacy/'+
        '${m['PharmacyID'][0]['imag_url']}';
    this.imgDrug =_path+'Itmes/'+
        '${m['DrugsID'][0]['imag_url']}';

  }
}
