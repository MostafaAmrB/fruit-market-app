// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables , prefer_final_fields

import 'package:flutter/cupertino.dart';
import '../models/models.dart';

class FoodProvider with ChangeNotifier {
  List<Vegetable> _vegetables = [
    Vegetable(
      id: '1',
      title: 'Broccoli',
      type: VegetableType.OrganicVegetables,
      description:
          'Grapes will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 300,
      imageURL: 'assets/images/vegetables/broccoli.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 4,
    ),
    Vegetable(
      id: '2',
      title: 'Brinjils',
      type: VegetableType.OrganicVegetables,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 160,
      imageURL: 'assets/images/vegetables/brinjels.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 5,
    ),
    Vegetable(
      id: '3',
      title: 'Corriander',
      type: VegetableType.OrganicVegetables,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 120,
      imageURL: 'assets/images/vegetables/corriander.JPG',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 4,
    ),
    Vegetable(
      id: '4',
      title: 'Multi Vegetables Pack',
     type: VegetableType.MixedVegetables,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 350,
      imageURL: 'assets/images/vegetables/multivegetables1.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 4,
    ),
    Vegetable(
      id: '5',
      title: 'Paper Vegetables Pack',
      type: VegetableType.MixedVegetables,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 230,
      imageURL: 'assets/images/vegetables/multivegetables2.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 4,
    ),
    Vegetable(
      id: '6',
      title: 'Tropicana',
      type: VegetableType.MixedVegetables,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 140,
      imageURL: 'assets/images/vegetables/multivegetables3.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 4,
    ),
    Vegetable(
      id: '7',
      title: 'Onion',
      type: VegetableType.AlliumVegetables,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 250,
      imageURL: 'assets/images/vegetables/onion.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 5,
    ),
    Vegetable(
      id: '8',
      title: 'Garlic',
      type: VegetableType.AlliumVegetables,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 180,
      imageURL: 'assets/images/vegetables/garlic.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 5,
    ),
    Vegetable(
      id: '9',
      title: 'Ginger',
      type: VegetableType.AlliumVegetables,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 100,
      imageURL: 'assets/images/vegetables/ginger.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 5,
    ),
    Vegetable(
      id: '10',
      title: 'Carrots',
      type: VegetableType.RootVegetables,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 100,
      imageURL: 'assets/images/vegetables/carrots.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 5,
    ),
    Vegetable(
      id: '11',
      title: 'White Carrots',
      type: VegetableType.RootVegetables,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 160,
      imageURL: 'assets/images/vegetables/carrots2.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 5,
    ),
    Vegetable(
      id: '12',
      title: 'Sweet Potatos',
      type: VegetableType.RootVegetables,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 100,
     imageURL: 'assets/images/vegetables/carrots3.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 4,
    ),
    
  ];
  List<Fruit> _fruits = [
    Fruit(
      id: '1',
      title: 'Grapes',
      type: FruitType.OrganicFruits,
      description:
          'Grapes will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 300,
      imageURL: 'assets/images/fruits/grapes.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 4,
    ),
    Fruit(
      id: '2',
      title: 'Strawberry',
      type: FruitType.OrganicFruits,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 160,
      imageURL: 'assets/images/fruits/strawberry.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 5,
    ),
    Fruit(
      id: '3',
      title: 'Oranges',
      type: FruitType.OrganicFruits,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 120,
      imageURL: 'assets/images/fruits/oranges.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 4,
    ),
    Fruit(
      id: '4',
      title: 'Multi Fruits Pack',
      type: FruitType.MixedFruit,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 350,
      imageURL: 'assets/images/fruits/multifruit1.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 4,
    ),
    Fruit(
      id: '5',
      title: 'Paper Fruits Pack',
      type: FruitType.MixedFruit,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 230,
      imageURL: 'assets/images/fruits/multifruit2.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 4,
    ),
    Fruit(
      id: '6',
      title: 'Tropicana',
      type: FruitType.MixedFruit,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 140,
      imageURL: 'assets/images/fruits/multifruit3.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 4,
    ),
    Fruit(
      id: '7',
      title: 'Nectarines',
      type: FruitType.StoneFruit,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 250,
      imageURL: 'assets/images/fruits/nectarines.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 5,
    ),
    Fruit(
      id: '8',
      title: 'Apricots',
      type: FruitType.StoneFruit,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 180,
      imageURL: 'assets/images/fruits/apricot.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 5,
    ),
    Fruit(
      id: '9',
      title: 'Peaches',
      type: FruitType.StoneFruit,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 100,
      imageURL: 'assets/images/fruits/peaches.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 5,
    ),
    Fruit(
      id: '10',
      title: 'Green Melons',
      type: FruitType.Melons,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 100,
      imageURL: 'assets/images/fruits/melons1.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 5,
    ),
    Fruit(
      id: '11',
      title: 'Dry Melons',
      type: FruitType.Melons,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 160,
      imageURL: 'assets/images/fruits/melons2.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 5,
    ),
    Fruit(
      id: '12',
      title: 'Orange Melons',
      type: FruitType.Melons,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 100,
      imageURL: 'assets/images/fruits/melons3.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 4,
    ),
    
  ];
  List<DryFruit> _dryFruits = [
    DryFruit(
      id: '1',
      title: 'Cashewnuts',
      type: DryFruitType.IndehiscentDryFruit,
      description:
          'Grapes will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 300,
      imageURL: 'assets/images/dryfruits/cashewnuts.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 4,
    ),
    DryFruit(
      id: '2',
      title: 'Walnuts',
      type: DryFruitType.IndehiscentDryFruit,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 160,
      imageURL: 'assets/images/dryfruits/walnuts.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 5,
    ),
    DryFruit(
      id: '3',
      title: 'Hazelnuts',
      type: DryFruitType.IndehiscentDryFruit,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 120,
      imageURL: 'assets/images/dryfruits/hazelnuts.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 4,
    ),
    DryFruit(
      id: '4',
      title: 'Multi Dry Fruits Pack',
    type: DryFruitType.MixedDryFruit,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 350,
      imageURL: 'assets/images/dryfruits/multidryfruits1.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 4,
    ),
    DryFruit(
      id: '5',
      title: 'Paper Dry Fruits Pack',
      type: DryFruitType.MixedDryFruit,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 230,
      imageURL: 'assets/images/dryfruits/multidryfruits2.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 4,
    ),
    DryFruit(
      id: '6',
      title: 'Tropicana',
      type: DryFruitType.MixedDryFruit,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 140,
      imageURL: 'assets/images/dryfruits/multidryfruits3.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 4,
    ),
    DryFruit(
      id: '7',
      title: 'Almond',
      type: DryFruitType.DehiscentDryFruit,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 250,
      imageURL: 'assets/images/dryfruits/almond.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 5,
    ),
    DryFruit(
      id: '8',
      title: 'Anjeer',
      type: DryFruitType.DehiscentDryFruit,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 180,
      imageURL: 'assets/images/dryfruits/anjeer.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 5,
    ),
    DryFruit(
      id: '9',
      title: 'Aam papad',
      type: DryFruitType.DehiscentDryFruit,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 100,
      imageURL: 'assets/images/dryfruits/aam papand.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 5,
    ),
    DryFruit(
      id: '10',
      title: 'Pink Kashmiri',
      type: DryFruitType.KashmiriDryFruit,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 100,
      imageURL: 'assets/images/dryfruits/kashmiri1.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 5,
    ),
    DryFruit(
      id: '11',
      title: 'Kashmiri',
      type: DryFruitType.KashmiriDryFruit,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 160,
      imageURL: 'assets/images/dryfruits/kashmiri2.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 5,
    ),
    DryFruit(
      id: '12',
      title: 'Wet Kashmiri',
      type: DryFruitType.KashmiriDryFruit,
      description:
          'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
      pricePerKilo: 100,
      imageURL: 'assets/images/dryfruits/kashmiri3.jpg',
      nutrition: ['Fiber', 'Fat', 'Potassium', 'Zinc', 'Vitamin A', 'Vitamin B'],
      starRating: 4,
    ),
    
  ];

  List<Vegetable> get vegetablesItems => [..._vegetables];
  List<Fruit> get fruitsItems => [..._fruits];
  List<DryFruit> get dryFruitsItems => [..._dryFruits];

  void fetchFood() {
    // To be constructed.
    print('Food Fetched');
  }
}
