// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables , prefer_final_fields
import 'package:flutter/material.dart';
import 'package:fruit_market_final/screens/details_screen.dart';
import '../models/models.dart';
import '../constants.dart';
import '../screens/screens.dart';

class ItemCard extends StatelessWidget {
  final item ;

  ItemCard(this.item);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(DetailsScreen.RouteName , arguments: item);
      },
      child: Container(
        width: 120,
       
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: _buildImage(),
            ),
            _buildStarRow(4),
            FittedBox(child: Text(item.title! , style: TextStyle(color: Colors.black , fontSize: 16 , fontWeight: FontWeight.bold),)),
            SizedBox(height:5),
            Text('\$${item.pricePerKilo!} Per/Kg', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),),
            SizedBox(height:5),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kDefaultBorderRaduis),
      child: Image.asset(
        item.imageURL!,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }

  Widget _buildStarRow(int rating) {
    int countStars = 5;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: List.generate(
          countStars,
          (index) => Icon(
            Icons.star,
            size: kStarSize,
            color: index < rating ? kStarColor : kGrayColor,
          ),
        ),
      ),
    );
  }
}
