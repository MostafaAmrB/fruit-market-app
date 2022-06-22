// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables , prefer_final_fields
import 'package:fruit_market_final/providers/food_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../models/models.dart';

class CartItemFirebase {
  String productId; //Cart Id
  int quantity;
  String type;

  CartItemFirebase(
      {required this.productId, required this.quantity, required this.type});
}

class CartProvider with ChangeNotifier {
  final firestore = FirebaseFirestore.instance;
  final collectionName = 'carts';

  List<CartItemFirebase> _cartItemsList = [];

  CartProvider() {
    fetchItemsFirebase();
  }

  List<CartItemFirebase> get cartItemsList => [..._cartItemsList];

  void fetchItemsFirebase() {
    _cartItemsList.clear();
    print('Fetching Cart Items');
    firestore.collection(collectionName).get().then((snapshot) {
      snapshot.docs.forEach((element) {
        CartItemFirebase newItem = CartItemFirebase(
            productId: element.id,
            quantity: element['quantity'],
            type: element['type']);
        _cartItemsList.add(newItem);
      });
      notifyListeners();
    });
  }

  void addCartItemFirebase(String productId, String type) async {
    //Check if there is item with that id

    final documentSnapShot =
        await firestore.collection(collectionName).doc(productId).get();
    // Checking existance of item
    if (documentSnapShot.exists) {
      // Item is already existed , update its quantity
      int newQuantity = documentSnapShot.get('quantity') + 1;

      firestore
          .collection(collectionName)
          .doc(productId)
          .update({'quantity': newQuantity}).then((value) {
        print('Qunatity Updated');
        int index = _cartItemsList
            .indexWhere((element) => element.productId == productId);
        _cartItemsList[index].quantity = newQuantity;
        notifyListeners();
      });
    } else {
      // Item not found , add new one with qunantity 1
      firestore
          .collection(collectionName)
          .doc(productId)
          .set({'quantity': 1, 'type': type}).then((value) {
        print('Cart Added to FireBase with $productId');
        _cartItemsList.add(
            CartItemFirebase(productId: productId, quantity: 1, type: type));
        notifyListeners();
      });
    }
  }

  void deleteCartItemFirebase(String productId) async {
    //Check if there is item with that id

    final documentSnapShot =
        await firestore.collection(collectionName).doc(productId).get();
    // Checking existance of item
    if (documentSnapShot.exists) {
      firestore
          .collection(collectionName)
          .doc(productId)
          .delete()
          .then((value) {
        print('Item is Successfully deleted');

        _cartItemsList.removeWhere((element) => element.productId == productId);

        notifyListeners();
      });
    }
  }

  void incrementCartItemQuantityFirebase(String productId) async {
    //Check if there is item with that id

    final documentSnapShot =
        await firestore.collection(collectionName).doc(productId).get();
    // Checking existance of item
    if (documentSnapShot.exists) {
      // Item is already existed , update its quantity
      int newQuantity = documentSnapShot.get('quantity') + 1;

      firestore
          .collection(collectionName)
          .doc(productId)
          .update({'quantity': newQuantity}).then((value) {
        print('Qunatity Updated');

        int index = _cartItemsList
            .indexWhere((element) => element.productId == productId);
        _cartItemsList[index].quantity = newQuantity;

        notifyListeners();
      });
    }
  }

  void decrementCartItemQuantityFirebase(String productId) async {
    //Check if there is item with that id

    final documentSnapShot =
        await firestore.collection(collectionName).doc(productId).get();
    // Checking existance of item
    if (documentSnapShot.exists) {
      // Item is already existed , update its quantity

      if (documentSnapShot.get('quantity') > 1) {
        int newQuantity = documentSnapShot.get('quantity') - 1;

        firestore
            .collection(collectionName)
            .doc(productId)
            .update({'quantity': newQuantity}).then((value) {
          print('Qunatity Updated');

          int index = _cartItemsList
              .indexWhere((element) => element.productId == productId);
          _cartItemsList[index].quantity = newQuantity;
          notifyListeners();
        });
      } else {
        deleteCartItemFirebase(productId);
      }
    }
  }

  List<Fruit> getFruitsFromCart(BuildContext context) {
    List<Fruit> items = [];

    _cartItemsList.forEach((element) {
      if (element.type == 'Fruit') {
        Fruit item = Provider.of<FoodProvider>(context, listen: false)
            .getFruitById(element.productId);
        items.add(item);
      }
    });

    return items;
  }

  List<DryFruit> getDryFruitsFromCart(BuildContext context) {
    List<DryFruit> items = [];

    _cartItemsList.forEach((element) {
      if (element.type == 'DryFruit') {
        DryFruit item = Provider.of<FoodProvider>(context, listen: false)
            .getDryFruitById(element.productId);
        items.add(item);
      }
    });

    return items;
  }

  List<Vegetable> getVegetablesFromCart(BuildContext context) {
    List<Vegetable> items = [];

    _cartItemsList.forEach((element) {
      if (element.type == 'Vegetable') {
        Vegetable item = Provider.of<FoodProvider>(context, listen: false)
            .getVegetableById(element.productId);
        items.add(item);
      }
    });

    return items;
  }
}
