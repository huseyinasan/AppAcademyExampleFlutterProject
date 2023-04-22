import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/modals/ogretmen.dart';
import 'package:ogrenci_app/services/data_service.dart';

class OgretmenlerRepository extends ChangeNotifier {

  List<Ogretmen> ogretmenler = [
    Ogretmen("Faruk", "Ham", 39, "Erkek"),
    Ogretmen("Hatice", "Keskin", 43, "Kadın"),
  ];
  final DataService dataService;
  OgretmenlerRepository(this.dataService);

  Future<void> indir() async {
    Ogretmen ogretmen = await dataService.ogretmenIndir();

    ogretmenler.add(ogretmen);
    notifyListeners();
  }

  Future<List<Ogretmen>> hepsiniGetir() async {
    ogretmenler = await dataService.ogretmenleriGetir();
    return ogretmenler;
  }
}

final ogretmenlerProvider = ChangeNotifierProvider((ref) {
  return OgretmenlerRepository(ref.watch(dataServiceProvider));
});

final ogretmenListesiProvider = FutureProvider((ref) {
  return ref.watch(ogretmenlerProvider).hepsiniGetir();
});
