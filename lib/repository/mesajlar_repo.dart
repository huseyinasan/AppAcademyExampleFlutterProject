class MesajlarRepository{

  final List <Mesaj> mesajlar = [
    Mesaj("Merhaba, Ayşe naber!", "Huseyin", DateTime.now().subtract(const Duration(minutes:3 ))),
    Mesaj("Selam Hüseyin, iyiyim senden naber!", "Ayşe", DateTime.now().subtract(const Duration(minutes:2 ))),
    Mesaj("İyiyim teşekkürler. Ödevleri yaptın mı?", "Huseyin", DateTime.now().subtract(const Duration(minutes:1 ))),
    Mesaj("Evet şimdi bitirdim", "Ayşe", DateTime.now()),

  ];

  int yeniMesajSayisi = 4;

}

class Mesaj{
  String yazi;
  String gonderen;
  DateTime zaman;

  Mesaj(this.yazi, this.gonderen, this.zaman);
}