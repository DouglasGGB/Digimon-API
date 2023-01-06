class DigimonModel {
  String name, img, level;

  DigimonModel({
    required this.img,
    required this.name,
    required this.level
  });
  
  DigimonModel copyWith({
    String? img,
    String? name, 
    String? level,
  })=>DigimonModel(
    img: img ?? this.img, 
    name: name ?? this.name, 
    level: level ?? this.level);

  factory DigimonModel.fromJsonMap(Map jsonMap)=>DigimonModel(
    img  :jsonMap["img"] ?? "https://wikimon.net/images/6/61/Digimon_noimage.jpg",
    name :jsonMap['name'] ?? "not found",
    level:jsonMap["level"] ?? "not found",
  );

  Map <String,dynamic> toJson()=>{
    "name" :name,
    "img"  :img,
    "level":level,
  };
}