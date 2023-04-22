import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/modals/ogretmen.dart';

class DataService{
  final String baseUrl = "https://6437008c3e4d2b4a12e14fb2.mockapi.io/";
  Future<Ogretmen> ogretmenIndir() async {
    final response = await http.get(Uri.parse('$baseUrl/ogretmen/1'));
    if (response.statusCode == 200) {
      return Ogretmen.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Öğretmen indirilemedi. ${response.statusCode}');
    }
  }

  Future <void> ogretmenEkle(Ogretmen ogretmen) async{
    await FirebaseFirestore.instance.collection("ogretmenler")
    .add(ogretmen.toMap());


    final response = await http.post(
      Uri.parse('$baseUrl/ogretmen/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(ogretmen.toMap()),
    );
    if (response.statusCode == 201) {
      return;
    } else {
      throw Exception('Öğretmen eklenemedi. ${response.statusCode}');
    }

  }

  Future<List<Ogretmen>> ogretmenleriGetir() async {
    final querySnapshot = await FirebaseFirestore.instance.collection("ogretmenler").get();

    return querySnapshot.docs.map((e) => Ogretmen.fromMap(e.data())).toList();
  }
}

final dataServiceProvider = Provider((ref) {
  return DataService();
});