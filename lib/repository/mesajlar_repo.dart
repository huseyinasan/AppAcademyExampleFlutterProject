import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/modals/mesaj.dart';

class MesajlarRepository extends ChangeNotifier{

  final List <Mesaj> mesajlar = [
    Mesaj("Merhaba, Ayşe naber!", "Huseyin", DateTime.now().subtract(const Duration(minutes:3 ))),
    Mesaj("Selam Hüseyin, iyiyim senden naber!", "Ayşe", DateTime.now().subtract(const Duration(minutes:2 ))),
    Mesaj("İyiyim teşekkürler. Ödevleri yaptın mı?", "Huseyin", DateTime.now().subtract(const Duration(minutes:1 ))),
    Mesaj("Evet şimdi bitirdim", "Ayşe", DateTime.now()),

  ];

}

final mesajlarProvider = ChangeNotifierProvider((ref){
  return  MesajlarRepository();
});

class YeniMesajSayisi extends StateNotifier<int>{
  YeniMesajSayisi(int state) : super(state);

  void sifirla(){
    state = 0;
  }
}

final yeniMesajSayisiProvider = StateNotifierProvider<YeniMesajSayisi, int>((ref) {
    return YeniMesajSayisi(4);
});

