// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables , prefer_final_fields

enum FruitType{
  OrganicFruits,
  MixedFruit,
  StoneFruit,
  Melons,
}

class Fruit {
  String? id;
  FruitType? type;
  String? title;
  String? description;
  double? pricePerKilo;
  String? imageURL;
  int? starRating;
  List<String>? nutrition;

  Fruit({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.pricePerKilo,
    required this.imageURL,
    required this.nutrition,
    this.starRating,
  });

  Fruit.fromJson(Map<String , dynamic> data)
  {
    id = data['id'];
    type = FruitType.OrganicFruits;
    title = data['title'];
    description = data['description'];
    pricePerKilo = double.parse(data['pricePerKilo']);
    imageURL = data['imageURL'];
    starRating = int.parse(data['starRating']);
    nutrition = data['nutrition'];
  }

  Map<String , dynamic> toJson()
  {
    Map<String , dynamic > data ={
      'id' : id,
      'type' : type.toString(),
      'title' : title,
      'description' : description,
      'pricePerKilo' : pricePerKilo,
      'imageURL' : imageURL,
      'starRating' : starRating,
      'nutrition' : nutrition,
    };
    return data;
  }
}
