// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables , prefer_final_fields
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../constants.dart';
import '../widgets/widgets.dart';
import '../models/models.dart';

class FruitTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        children: [
          _buildCategoryContainer(
            categoryName: 'Organic Fruits',
            fruitType: FruitType.OrganicFruits,
            subTitle: 'Pick up from organic farms',
            sale: 20,
          ),
          _buildCategoryContainer(
            categoryName: 'Mixed Fruit Pack',
            fruitType: FruitType.MixedFruit,
            subTitle: 'Fruit mix fresh pack',
            sale: 10,
          ),
          _buildCategoryContainer(
            categoryName: 'Stone Fruits',
            fruitType: FruitType.StoneFruit,
            subTitle: 'Fresh stone fruits',
            sale: 20,
          ),
          _buildCategoryContainer(
            categoryName: 'Melons',
            fruitType: FruitType.Melons,
            subTitle: 'Fresh melon fruits',
            sale: 5,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryContainer(
      {required String categoryName,
      required FruitType fruitType,
      required String subTitle,
      int? sale}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleContainer(
            title: categoryName,
            subTitle: subTitle,
            sale: sale,
          ),
          _buildItemsListView(fruitType: fruitType),
        ],
      ),
    );
  }

  Widget _buildTitleContainer(
      {required String title, required String subTitle, int? sale}) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: kTitleTextstyle,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                '(${sale!}% OFF)',
                style: ksaleTextstyle,
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            subTitle,
            style: ksubTitleTextstyle,
          ),
        ],
      ),
    );
  }

  Widget _buildItemsListView({required FruitType fruitType}) {
    return Consumer<FoodProvider>(
      builder: (_, fruitProvider, __) {
        List<Fruit> items = fruitProvider.fruitsItems.where(
          (element) => element.type == fruitType,
        ).toList();

        print('Type ${fruitType} count is ${items.length}');
        return Container(
          height: 220,
          padding: EdgeInsets.all(5),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (_, index) => SizedBox(
              width: 10,
            ),
            itemBuilder: (_, index) => ItemCard(items[index]),
          ),
        );
      },
    );
  }
}
