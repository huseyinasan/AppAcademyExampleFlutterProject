import 'package:flutter/material.dart';
import 'package:ogrenci_app/pages/ogrenciler_sayfasi.dart';
import 'package:ogrenci_app/pages/mesajlar_sayfasi.dart';
import 'package:ogrenci_app/pages/ogretmenler_sayfasi.dart';
import 'package:ogrenci_app/repository/mesajlar_repo.dart';
import 'package:ogrenci_app/repository/ogrenciler_repo.dart';
import 'package:ogrenci_app/repository/ogretmenler_repo.dart';

void main() {
  runApp(const OgrenciApp());
}

class OgrenciApp extends StatelessWidget {
  const OgrenciApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Öğrenci Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnaSayfa(title: 'Öğrenci Ana Sayfa'),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key, required this.title});

  final String title;

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

  MesajlarRepository mesajlarRepository = MesajlarRepository();
  OgrencilerRepository ogrencilerRepository = OgrencilerRepository();
  OgretmenlerRepository ogretmenlerRepository = OgretmenlerRepository();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Öğrenci Adı'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Öğrenciler'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => OgrencilerSayfasi(ogrencilerRepository),
                ));
              },
            ),
            ListTile(
              title: Text('Öğretmenler'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => OgretmenlerSayfasi(ogretmenlerRepository),
                ));
              },
            ),
            ListTile(
              title: Text('Mesajlar'),
              onTap: ()  {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MesajlarSayfasi(mesajlarRepository)),
                );
              },
            ),
          ],
        ),
      ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                        GestureDetector(
                          onTap: () async{
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MesajlarSayfasi(mesajlarRepository)),
                            );
                          },
                            child: Text(
                                '${mesajlarRepository.yeniMesajSayisi} yeni mesaj',
                                style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OgrencilerSayfasi(ogrencilerRepository)),
                      );
                    },
                    child: Text(
                      '${ogrencilerRepository.ogrenciler.length} öğrenci',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OgretmenlerSayfasi(ogretmenlerRepository)),
                      );
                    },
                    child: Text(
                      '${ogretmenlerRepository.ogretmenler.length} öğretmen',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.blue,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}


