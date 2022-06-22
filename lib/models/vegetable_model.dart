// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables , prefer_final_fields
enum VegetableType{
  OrganicVegetables,
  MixedVegetables,
  AlliumVegetables,
  RootVegetables,
}

class Vegetable {
  String? id;
  VegetableType? type;
  String? title;
  String? description;
  double? pricePerKilo;
  String? imageURL;
  int? starRating;
  List<String>? nutrition;

  Vegetable({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.pricePerKilo,
    required this.imageURL,
    required this.nutrition,
    required this.starRating,
  });

  Vegetable.fromJson(Map<String , dynamic> data)
  {
    id = data['id'];
    title = data['title'];
    type = VegetableType.OrganicVegetables;
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
