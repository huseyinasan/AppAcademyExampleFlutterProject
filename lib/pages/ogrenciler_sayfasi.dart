import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/modals/ogrenci.dart';
import 'package:ogrenci_app/repository/ogrenciler_repo.dart';

class OgrencilerSayfasi extends ConsumerWidget {
  const OgrencilerSayfasi({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ogrencilerRepository = ref.watch(ogrencilerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Öğrenciler")),
      body: Column(
        children: [
          PhysicalModel(
            color: Colors.white,
            elevation: 10,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
                child: Text(
                  "${ogrencilerRepository.ogrenciler.length} Öğrenci"
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) =>  OgrenciSatiri(
                  ogrencilerRepository.ogrenciler[index],
                ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: ogrencilerRepository.ogrenciler.length)
          ),
        ],
      ),
    );
  }
}

class OgrenciSatiri extends ConsumerWidget {
  final Ogrenci ogrenci;
  const OgrenciSatiri(this.ogrenci, {
    super.key,
  });


  @override
  Widget build(BuildContext context, WidgetRef ref ) {
    bool seviyorMu = ref.watch(ogrencilerProvider).seviyorMu(ogrenci);
    return ListTile(
      title: AnimatedPadding(
        padding: seviyorMu? const EdgeInsets.only(left: 85): const EdgeInsets.only(left: 0),
        duration: const Duration(seconds: 1),
        curve: Curves.bounceOut,
        child: Text("${ogrenci.ad} ${ogrenci.soyad}")),
      leading: AnimatedRotation(
          turns: seviyorMu ? 2 : 0,
          duration: const Duration(seconds: 1),
          curve: Curves.bounceOut,
          child: Text(ogrenci.cinsiyet == "Kadın" ? "👩" : "👨" )), //👩👨
      trailing: IconButton(
          onPressed: () {
            ref.read(ogrencilerProvider).sev(ogrenci,!seviyorMu);
          },
          icon: AnimatedCrossFade(
            firstChild: const Icon(Icons.favorite, color: Colors.red),
            secondChild: const Icon(Icons.favorite_border),
            crossFadeState: seviyorMu ? CrossFadeState.showFirst: CrossFadeState.showSecond,
            duration: const Duration(seconds: 1),
          ),
      ),
    );
  }
}
