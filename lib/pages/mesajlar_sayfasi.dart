import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/modals/mesaj.dart';
import 'package:ogrenci_app/repository/mesajlar_repo.dart';

class MesajlarSayfasi extends ConsumerStatefulWidget {
  const MesajlarSayfasi({Key? key}) : super(key: key);

  @override
  _MesajlarSayfasiState createState() => _MesajlarSayfasiState();
}

class _MesajlarSayfasiState extends ConsumerState<MesajlarSayfasi> {

  @override
  void initState() {
    Future.delayed(Duration.zero).then(
            (value) => ref.read(yeniMesajSayisiProvider.notifier).sifirla()
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mesajlarRepository = ref.watch(mesajlarProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Mesajlar")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
                itemCount: mesajlarRepository.mesajlar.length,
                itemBuilder: (context, index) {
                  return MesajGorunumu(
                      mesajlarRepository.mesajlar[mesajlarRepository.mesajlar.length - index - 1]
                  );
                },
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: PhysicalModel(
              elevation: 20,
              color: Colors.white70,
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(25.0))
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none
                                ),
                              ),
                            )
                        ),
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          print("Gönder");
                        },
                        child: const Icon(Icons.send),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MesajGorunumu extends StatelessWidget {
  final Mesaj mesaj;
  const MesajGorunumu(this.mesaj, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: mesaj.gonderen == "Huseyin" ? Alignment.centerRight : Alignment.centerLeft ,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          bottom: 30,
          left: 10,
          top: 30,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 2),
            color: mesaj.gonderen == "Huseyin" ? Colors.tealAccent : Colors.green ,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
                style: const TextStyle(
                  fontSize: 17.0, // change this value to change the font size
                ),
                mesaj.yazi
            ),
          ),
        ),
      ),
    );
  }
}
