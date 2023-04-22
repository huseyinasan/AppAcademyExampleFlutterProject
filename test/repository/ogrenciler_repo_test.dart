import 'package:flutter_test/flutter_test.dart';
import 'package:ogrenci_app/modals/ogrenci.dart';
import 'package:ogrenci_app/repository/ogrenciler_repo.dart';

void main() {
  test('Sevdiğim öğrenci sevilmiş olarak görülüyor', () {
    final ogrencilerRepository = OgrencilerRepository();

    final yeniOgrenci = Ogrenci("test ad", "test soyad", 33, "Kadın");

    ogrencilerRepository.ogrenciler.add(yeniOgrenci);
    expect(ogrencilerRepository.seviyorMu(yeniOgrenci), false);
    ogrencilerRepository.sev(yeniOgrenci, true);
    expect(ogrencilerRepository.seviyorMu(yeniOgrenci), true);
    ogrencilerRepository.sev(yeniOgrenci, false);
    expect(ogrencilerRepository.seviyorMu(yeniOgrenci), false);
    ogrencilerRepository.ogrenciler.remove(yeniOgrenci);
    expect(ogrencilerRepository.seviyorMu(yeniOgrenci), false);
  });
}