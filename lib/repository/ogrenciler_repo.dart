class OgrencilerRepository{

  List ogrenciler = [
    Ogrenci("Huseyin", "Asan", 24, "Erkek"),
    Ogrenci("Ayşe", "Demir", 23, "Kadın"),
  ];

  final Set<Ogrenci> sevdiklerim = {};

  void sev(Ogrenci ogrenci, bool seviyorMu) {
    if(seviyorMu ){
      sevdiklerim.add(ogrenci);
    }else{
      sevdiklerim.remove(ogrenci);
    }
  }

  bool seviyorMu(Ogrenci ogrenci) {
    return sevdiklerim.contains(ogrenci);
  }
}

class Ogrenci{
  String ad;
  String soyad;
  int yas;
  String cinsiyet;

  Ogrenci(this.ad, this.soyad, this.yas, this.cinsiyet);
}