// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables , prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/models.dart';

class FoodProvider with ChangeNotifier {
  final firestore = FirebaseFirestore.instance;
  List<Vegetable> _vegetables = [];
  List<Fruit> _fruits = [];
  List<DryFruit> _dryFruits = [];

  List<Vegetable> get vegetablesItems => [..._vegetables];
  List<Fruit> get fruitsItems => [..._fruits];
  List<DryFruit> get dryFruitsItems => [..._dryFruits];

  FoodProvider() {
    fetchItems();
  }

  void fetchItems() {
    //First i need to fetch items from server , and add them to my local list
    print('Fetching Data from Firebase');
    firestore.collection('vegetables').get().then((querySnapShot) {
      print('Checking Vegetables');
      if (querySnapShot.docs.isNotEmpty) {
        print('Some Vegetables Items Found');
        _vegetables.clear();
        querySnapShot.docs.forEach((element) {
          final fetchedItem = Vegetable(
            id: element.id,
            type: stringtoVegetableEnum(element['type']), // Modified
            title: element['title'],
            description: element['description'],
            pricePerKilo: element['pricePerKilo'].toDouble(),
            imageURL: element['imageURL'],
            starRating: element['starRating'],
            nutrition: List<String>.from(element['nutrition']),
          );
          _vegetables.add(fetchedItem);
        });

        print('Finished Fetching Items');
        printItems();
        notifyListeners();
      }
    });

    firestore.collection('fruits').get().then((querySnapShot) {
      print('Checking Fruits');
      if (querySnapShot.docs.isNotEmpty) {
        print('Some Fruits Items Found');
        _fruits.clear();
        querySnapShot.docs.forEach((element) {
          final fetchedItem = Fruit(
            id: element.id,
            type: stringtoFruitEnum(element['type']), // Modified
            title: element['title'],
            description: element['description'],
            pricePerKilo: element['pricePerKilo'].toDouble(),
            imageURL: element['imageURL'],
            starRating: element['starRating'],
            nutrition: List<String>.from(element['nutrition']),
          );
          _fruits.add(fetchedItem);
        });

        print('Finished Fetching Items');
        printItems();
        notifyListeners();
      }
    });

    firestore.collection('dryFruits').get().then((querySnapShot) {
      print('Checking DryFruits');
      if (querySnapShot.docs.isNotEmpty) {
        print('Some DryFruits Items Found');
        _dryFruits.clear();
        querySnapShot.docs.forEach((element) {
          final fetchedItem = DryFruit(
            id: element.id,
            type: stringtoDryFruitEnum(element['type']), // Modified
            title: element['title'],
            description: element['description'],
            pricePerKilo: element['pricePerKilo'].toDouble(),
            imageURL: element['imageURL'],
            starRating: element['starRating'],
            nutrition: List<String>.from(element['nutrition']),
          );
          _dryFruits.add(fetchedItem);
        });

        print('Finished Fetching Items');
        printItems();
        notifyListeners();
      }
    });


  }

  Fruit getFruitById(String id)
  {
    return _fruits.firstWhere((element) => element.id == id) ;
  }

  Vegetable getVegetableById(String id)
  {
    return _vegetables.firstWhere((element) => element.id == id) ;
  }

  DryFruit getDryFruitById(String id)
  {
    return _dryFruits.firstWhere((element) => element.id == id) ;
  }


  VegetableType stringtoVegetableEnum(String item) {
    if (item == 'VegetableType.OrganicVegetables') {
      return VegetableType.OrganicVegetables;
    } else if (item == 'VegetableType.AlliumVegetables') {
      return VegetableType.AlliumVegetables;
    } else if (item == 'VegetableType.MixedVegetables') {
      return VegetableType.MixedVegetables;
    } else if (item == 'VegetableType.RootVegetables') {
      return VegetableType.RootVegetables;
    }
    return VegetableType.OrganicVegetables; //Default
  }

  FruitType stringtoFruitEnum(String item) {
    if (item == 'FruitType.Melons') {
      return FruitType.Melons;
    } else if (item == 'FruitType.MixedFruit') {
      return FruitType.MixedFruit;
    } else if (item == 'FruitType.OrganicFruits') {
      return FruitType.OrganicFruits;
    } else if (item == 'FruitType.StoneFruit') {
      return FruitType.StoneFruit;
    }
    return FruitType.OrganicFruits; //Default
  }

  DryFruitType stringtoDryFruitEnum(String item) {
    if (item == 'DryFruitType.DehiscentDryFruit') {
      return DryFruitType.DehiscentDryFruit;
    } else if (item == 'DryFruitType.IndehiscentDryFruit') {
      return DryFruitType.IndehiscentDryFruit;
    } else if (item == 'DryFruitType.KashmiriDryFruit') {
      return DryFruitType.KashmiriDryFruit;
    } else if (item == 'DryFruitType.MixedDryFruit') {
      return DryFruitType.MixedDryFruit;
    }
    return DryFruitType.DehiscentDryFruit; //Default
  }

  void printItems() {
    print('Length of Vegetables is ${_vegetables.length}');
    _vegetables.forEach((element) => print(element.type));
  }
}
