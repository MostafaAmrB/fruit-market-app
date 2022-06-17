// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables , prefer_final_fields
import 'package:flutter/material.dart';
import 'package:fruit_market_final/constants.dart';
import 'package:fruit_market_final/screens/home_screen.dart';
import 'package:fruit_market_final/screens/screens.dart';

class BottomsScreen extends StatefulWidget {
  static String RouteName = '/BottomsScreen';

  @override
  State<BottomsScreen> createState() => _BottomsScreenState();
}

class _BottomsScreenState extends State<BottomsScreen> {
  int _selectedIndex = 0;  
  List<dynamic> screens = [  
    HomeScreen(),
    ShoppingCartScreen(),
    Container(),
    ProfileScreen(),

  ];
  void _onItemTapped(int index) {  
    setState(() {  
      _selectedIndex = index;  
    });  
  }  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Shopping Cart', 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Favorite',
          ),
          
        ],
        type: BottomNavigationBarType.fixed,  
        currentIndex: _selectedIndex,  
        selectedItemColor: kGreenColor  ,  
       // iconSize: 40,  
        onTap: _onItemTapped,  
        elevation: 5,

      ),
    );
  }
}
