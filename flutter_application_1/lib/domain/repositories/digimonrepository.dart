import 'package:flutter_application_1/data/data_provider/data_provider_digimon.dart';
import 'package:flutter_application_1/domain/models/digimon.dart';

class DigimonRepository{
  DigimonProvider digimonProvider = DigimonProvider();
  List<DigimonModel> digimonList =[];
  List<DigimonModel> digimonListByLevel =[];
  DigimonModel? digimonSearched;
  final digimon404 = DigimonModel(
    img: "https://wikimon.net/images/6/61/Digimon_noimage.jpg", 
    name: "not found", 
    level: "not found"
  );

  Future<void> getAllDigimon() async {
    List<DigimonModel> temporalList = await digimonProvider.fetchAllDigimons();
    if(temporalList.isEmpty){
      temporalList.add(digimon404);
    }
    digimonList = temporalList;
    
  }

  Future<void> searchDigimonByName(String digimonName) async{
    List<DigimonModel> temporalList = await digimonProvider.searchDigimon(digimonName);
    if(temporalList.isEmpty){
      temporalList.add(digimon404);
    }
    digimonSearched = temporalList.first;
  }

  Future<void> searchDigimonByLevel(String digmonLevel) async{
    List<DigimonModel> temporalList = await digimonProvider.flitrerDigimonByLevel(digmonLevel);
    if(temporalList.isEmpty){
      temporalList.add(digimon404);
    }
    digimonListByLevel = temporalList;
  }
}