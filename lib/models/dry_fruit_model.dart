// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables , prefer_final_fields

enum DryFruitType{
  IndehiscentDryFruit,
  MixedDryFruit,
  DehiscentDryFruit,
  KashmiriDryFruit,
}

class DryFruit {
  String? id;
  DryFruitType? type;
  String? title;
  String? description;
  double? pricePerKilo;
  String? imageURL;
  int? starRating;
  List<String>? nutrition;

  DryFruit({
    required this.id,
    required this.title,
    required this.type,
    required this.description,
    required this.pricePerKilo,
    required this.imageURL,
    required this.nutrition,
    this.starRating,
  });

  DryFruit.fromJson(Map<String , dynamic> data)
  {
    id = data['id'];
    title = data['title'];
    type = DryFruitType.IndehiscentDryFruit;
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
      'title' : title,
      'type' : type.toString(),
      'description' : description,
      'pricePerKilo' : pricePerKilo,
      'imageURL' : imageURL,
      'starRating' : starRating,
      'nutrition' : nutrition,
    };
    return data;
  }
}
