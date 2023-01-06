import 'dart:convert';
import '../../domain/models.dart';

import 'package:http/http.dart' as http;

class DigimonException implements Exception{
  final String mesagge;
  DigimonException(this.mesagge);
   @override
  String toString() {
    return "Code error: $mesagge";
  }
}

class DigimonProvider {

  Future<List<DigimonModel>> fetchAllDigimons() async{
    const rawUrl = "https://digimon-api.vercel.app/api/digimon";
    final response = await http.get(Uri.parse(rawUrl));
    if(response.statusCode != 200){
      throw DigimonException(response.body);
    }
    try{
      final body = response.body;
      final decoded = json.decode(body) as List;
      final listModel = decoded.map((e) => DigimonModel.fromJsonMap(e)).toList();
      return listModel;
    }catch(error){
      throw DigimonException(error.toString());
    }
  }

  Future<List<DigimonModel>> searchDigimon(String query) async{
    final rawUrl ="https://digimon-api.vercel.app/api/digimon/name/$query";
    final response = await http.get(Uri.parse(rawUrl));
    if(response.statusCode != 200){
      throw DigimonException(response.body);
    }
    try{
      final body = response.body;
      final decoded = json.decode(body) as List;
      final listModel = decoded.map((e) => DigimonModel.fromJsonMap(e)).toList();
      return listModel;
    }catch(error){
      throw DigimonException(error.toString());
    }
  }

  Future<List<DigimonModel>> flitrerDigimonByLevel(String query)async{
    final rawUrl ="https://digimon-api.vercel.app/api/digimon/level/$query";
    final response = await http.get(Uri.parse(rawUrl));
    if(response.statusCode != 200){
      throw DigimonException(response.body);
    }
    try{
      final body = response.body;
      final decoded = json.decode(body) as List;
      final listModel = decoded.map((e) => DigimonModel.fromJsonMap(e)).toList();
      return listModel;
    }catch(error){
      throw DigimonException(error.toString());
    }
  }
}