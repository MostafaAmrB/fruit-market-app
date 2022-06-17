// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables , prefer_final_fields
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../models/models.dart';
import '../constants.dart';

class DetailsScreen extends StatelessWidget {
  static String RouteName = '/DetailsScreen';
  late final item;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    item = ModalRoute.of(context)!.settings.arguments ;
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             _buildImage(),
            _buildDescription(),
            _buildNutrition(),
            Spacer(),
            _buildButtomButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildButtomButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\$${item.pricePerKilo!} Per/Kg',
            style: kTitleTextstyle,
          ),
          OutlinedButton(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('Buy Now'),
            ),
            style: OutlinedButton.styleFrom(
              primary: Colors.white,
              backgroundColor: kGreenColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
            onPressed: () => buyItem(context),
          )
        ],
      ),
    );
  }

  void buyItem(BuildContext context)
  {
    final cartProvider = Provider.of<CartProvider>(context , listen: false);
    String newId = item.runtimeType.toString()+item.id;
    cartProvider.addCartItem(newId, item);
  }

  Widget _buildNutrition() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Nutrition',
            style: kTitleTextstyle,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
           height: 150,
            child: ListView.builder(
                itemCount: item.nutrition!.length,
                itemBuilder: (_, index) =>
                    _itemNutrition(item.nutrition![index])),
          )
        ],
      ),
    );
  }

  Widget _itemNutrition(String label) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical:5),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            size: 8,
            color: Colors.black54,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            label,
            style: TextStyle(color: Colors.black54),
          )
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            item.title!,
            style: kTitleTextstyle,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Text(
                item.description!,
                maxLines: 8,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black54),
              )),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      //margin: EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
        child: Image.asset(
          item.imageURL!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 150,
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(item.title!),
      elevation: 0,
    );
  }
}
