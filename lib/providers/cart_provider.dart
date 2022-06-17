// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables , prefer_final_fields
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class CartItem {
  String id; //Cart Id
  dynamic item;
  int quantity;

  CartItem({required this.id, required this.item, required this.quantity});
}

class CartProvider with ChangeNotifier {
  // Key will be the NameOfProduct+productId like 'Fruit10'  , and value will be the item
  Map<String, CartItem> _cartItems = {};
  
  /*Map<String, CartItem> _cartItems = {
    'Fruit1': CartItem(
        id: '15',
        item: Fruit(
          id: '1',
          title: 'Grapes',
          type: FruitType.OrganicFruits,
          description:
              'Grapes will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
          pricePerKilo: 300,
          imageURL: 'assets/images/fruits/grapes.jpg',
          nutrition: [
            'Fiber',
            'Fat',
            'Potassium',
            'Zinc',
            'Vitamin A',
            'Vitamin B'
          ],
          starRating: 4,
        ),
        quantity: 2),
    'Fruit2': CartItem(
        id: 'id',
        item: Fruit(
          id: '2',
          title: 'Strawberry',
          type: FruitType.OrganicFruits,
          description:
              'Strawberry will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
          pricePerKilo: 160,
          imageURL: 'assets/images/fruits/strawberry.jpg',
          nutrition: [
            'Fiber',
            'Fat',
            'Potassium',
            'Zinc',
            'Vitamin A',
            'Vitamin B'
          ],
          starRating: 5,
        ),
        quantity: 5),
    'DryFruit1': CartItem(
        id: 'id',
        item: DryFruit(
          id: '1',
          title: 'Cashewnuts',
          type: DryFruitType.IndehiscentDryFruit,
          description:
              'Grapes will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
          pricePerKilo: 300,
          imageURL: 'assets/images/dryfruits/cashewnuts.jpg',
          nutrition: [
            'Fiber',
            'Fat',
            'Potassium',
            'Zinc',
            'Vitamin A',
            'Vitamin B'
          ],
          starRating: 4,
        ),
        quantity: 5),
  };*/
  Map<String, CartItem> get cartItems => {..._cartItems};

  void addCartItem(String productId, dynamic item) {
    if (_cartItems.containsKey(productId)) {
      // Then Increase Quantity only
      _cartItems.update(
          productId,
          (existingItem) => CartItem(
              id: existingItem.id,
              item: existingItem.item,
              quantity: existingItem.quantity + 1));
      print('Item is Successfully Updated');
    } else {
      // Add new CartItem with quantity 1
      _cartItems.putIfAbsent(
          productId,
          () =>
              CartItem(id: DateTime.now().toString(), item: item, quantity: 1));
      print('Item is Successfully added');
    }
    printCartItems();
    notifyListeners();
  }

  void removeCartItem(String productId) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.remove(productId);
    }
    notifyListeners();
  }

  void incrementItem(String productId) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (existingItem) => CartItem(
              id: existingItem.id,
              item: existingItem.item,
              quantity: existingItem.quantity + 1));
    }
    notifyListeners();
  }

  void decrementItem(String productId) {
    if (_cartItems.containsKey(productId)) {
      if (_cartItems[productId]!.quantity == 1) {
        // So Remove This item
        _cartItems.remove(productId);
      } else {
        _cartItems.update(
            productId,
            (existingItem) => CartItem(
                id: existingItem.id,
                item: existingItem.item,
                quantity: existingItem.quantity - 1));
      }
    }
    notifyListeners();
  }

  void printCartItems() {
    _cartItems.forEach((key, value) {
      print('$key ${value.quantity}');
    });
  }

  List<CartItem> getFruitsFromCart() {
    List<CartItem> items = [];
    _cartItems.forEach((key, value) {
      if (key.startsWith('Fruit')) {
        items.add(value);
      }
    });

    print('Fruits From Cart Length is ${items.length}');
    

    return items;
  }

  List<CartItem> getDryFruitsFromCart() {
    List<CartItem> items = [];
    _cartItems.forEach((key, value) {
      if (key.startsWith('DryFruit')) {
        items.add(value);
      }
    });

    print('DryFruits From Cart Length is ${items.length}');

    return items;
  }

  List<CartItem> getVegetablesFromCart() {
    List<CartItem> items = [];
    _cartItems.forEach((key, value) {
      if (key.startsWith('Vegetable')) {
        items.add(value);
      }
    });

    print('Vegetables From Cart Length is ${items.length}');

    return items;
  }
}
