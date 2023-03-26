import 'package:flutter/material.dart';
import 'package:ogrenci_app/repository/ogretmenler_repo.dart';

class OgretmenlerSayfasi extends StatefulWidget {
  final ogretmenlerRepository;
  const OgretmenlerSayfasi(this.ogretmenlerRepository, {Key? key}) : super(key: key);

  @override
  State<OgretmenlerSayfasi> createState() => _OgretmenlerSayfasiState();
}

class _OgretmenlerSayfasiState extends State<OgretmenlerSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Öğretmenler")),
      body: Column(
        children: [
          PhysicalModel(
            color: Colors.white,
            elevation: 10,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
                child:  Text(
                    "${widget.ogretmenlerRepository.ogretmenler.length} Öğretmen"
                ),
              ),
            ),
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) =>  OgretmenSatiri(
                  widget.ogretmenlerRepository.ogretmenler[index],
                  widget.ogretmenlerRepository,
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: widget.ogretmenlerRepository.ogretmenler.length),
          ),
        ],
      ),
    );
  }
}

class OgretmenSatiri extends StatelessWidget {
  
  const OgretmenSatiri(ogrenciler, ogretmenlerRepository, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text("Hatice"),
      leading: Text("👩👨"),//👩👨
    );
  }
}

class OgrenciSatiri extends StatefulWidget {
  final Ogretmen ogretmen;
  final OgretmenlerRepository ogretmenlerRepository;
  const OgrenciSatiri(this.ogretmen, this.ogretmenlerRepository , {
    super.key,
  });

  @override
  State<OgrenciSatiri> createState() => _OgretmenSatiriState();
}

class _OgretmenSatiriState extends State<OgrenciSatiri> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.ogretmen.ad + " " + widget.ogretmen.soyad),
      leading: IntrinsicWidth(child: Center(child: Text(widget.ogretmen.cinsiyet == "Kadın" ? "👩" : "👨" ))), //👩👨
    );
  }
}