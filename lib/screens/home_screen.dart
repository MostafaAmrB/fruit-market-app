// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables , prefer_final_fields
import 'package:flutter/material.dart';
import '../constants.dart';
import '../tabs/tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController!.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
           // _buildSearchTextField(),
            Expanded(child: _buildTabContainer()),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      toolbarHeight: 100,
      title: Text(
        'Fruit Market',
        style: kAppBarTextstyle,
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
      ],
    );
  }

  Widget _buildSearchTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultBorderRaduis / 2),
        border: Border.all(color: Colors.black),
      ),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle:
                TextStyle(color: kGrayColor, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildTabContainer() {
    return Column(
      //mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          //padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          margin: EdgeInsets.symmetric(vertical: 10),
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            labelPadding: EdgeInsets.symmetric(horizontal: 5),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black87,
            indicatorColor: Colors.transparent,
            tabs: [
              ContainerTab(title: 'Vegetables', index: 0),
              ContainerTab(title: 'Fruits', index: 1),
              ContainerTab(title: 'Dry Fruits', index: 2),
            ],
          ),
        ),
        Expanded(
          child: Container(
            //height: 400,
            child: TabBarView(
              controller: _tabController,
              children: [
                VegetablesTab(),
                FruitTab(),
                DryFruitTab(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget ContainerTab({required String title, required int index}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
        color:
            _tabController!.index == index ?kOrangeColor : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Tab(
        height: 30,
        text: title,
      ),
    );
  }
}
