import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/modals/ogrenci.dart';

class OgrencilerRepository extends ChangeNotifier {

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
    notifyListeners();
  }

  bool seviyorMu(Ogrenci ogrenci) {
    return sevdiklerim.contains(ogrenci);
  }
}

final ogrencilerProvider = ChangeNotifierProvider((ref) {
  return OgrencilerRepository();
});

