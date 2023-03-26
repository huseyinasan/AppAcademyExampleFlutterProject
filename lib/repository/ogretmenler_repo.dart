class OgretmenlerRepository{

  List ogretmenler = [
    Ogretmen("Faruk", "Ham", 39, "Erkek"),
    Ogretmen("Hatice", "Keskin", 43, "Kadın"),
  ];
}

class Ogretmen{
  String ad;
  String soyad;
  int yas;
  String cinsiyet;

  Ogretmen(this.ad, this.soyad, this.yas, this.cinsiyet);
}