// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables , prefer_final_fields, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../models/models.dart';
import '../constants.dart';

class ShoppingCartScreen extends StatelessWidget {
  static String RouteName = '/ShoppingCartScreen';
  late CartProvider _cartProvider;
  @override
  Widget build(BuildContext context) {
    _cartProvider = Provider.of<CartProvider>(context);
    print('CartsPage is rebuilding');

    // TODO: implement build
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        //padding: EdgeInsets.all(kDefaultPadding),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCategoryContainer(category: 'Vegetables' , context: context),
              _buildCategoryContainer(category: 'Dry Fruits', context: context),
              _buildCategoryContainer(category: 'Fruits', context: context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryContainer({required String category , required BuildContext context }) {
    return Consumer<CartProvider>(
      builder: (_, cartProvider, __) {
        List<dynamic> items = [];
        if (category == 'Fruits')
          items = cartProvider.getFruitsFromCart(context);
        else if (category == 'Dry Fruits')
          items = cartProvider.getDryFruitsFromCart(context);
        else if (category == 'Vegetables')
          items = cartProvider.getVegetablesFromCart(context);

        return Container(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: kGrayColor,
                padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
                child: Text(
                  category,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              items.length > 0 ?Container(
                child: Column(
                  children: List.generate(
                    items.length,
                    (index) => _buildCartItemContainer(item: items[index]),
                  ),
                ),
              ): Container(
                padding: EdgeInsets.all(20),
                child: Text('There is no Items' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 16),),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCartItemContainer({required dynamic item}) {
    return Container(
      height: 120,
      padding: EdgeInsets.all(kDefaultPadding),
      //color: Colors.red,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(shape: BoxShape.rectangle),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                item.imageURL,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  ' RS 190 ',
                  style: TextStyle(
                      fontSize: 12, decoration: TextDecoration.lineThrough),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${item.pricePerKilo} Per/Kg',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Rs 40 Saved',
            style: TextStyle(
              color: kGreenColor,
              fontSize: 12,
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(left: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      _cartProvider.deleteCartItemFirebase(item.id);
                    },
                    child: Icon(Icons.delete)),
                Spacer(),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _cartProvider.decrementCartItemQuantityFirebase(item.id);
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Icon(
                          Icons.remove,
                          size: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        _cartProvider.cartItemsList.firstWhere((element) => element.productId == item.id).quantity.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _cartProvider.incrementCartItemQuantityFirebase(item.id);
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(
        'Shopping Cart',
      ),
      elevation: 0,
    );
  }
}
