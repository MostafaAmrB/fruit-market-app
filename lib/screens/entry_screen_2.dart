// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables , prefer_final_fields
import 'package:flutter/material.dart';
import 'package:fruit_market_final/constants.dart';
import '../screens/screens.dart';

class EntryScreen2 extends StatefulWidget {
  @override
  State<EntryScreen2> createState() => _EntryScreen2State();
}

class _EntryScreen2State extends State<EntryScreen2> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();
  List<dynamic> pages = [
    // buildLogo1(),
    Container(
      child: Column(
        children: [
          Expanded(flex : 2 ,child: Image.asset('assets/images/logos/logo1.png')),
          Text(
            'E Shopping',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: kDarkBlue),
          ),
          Text('Explore top organic fruits & grab them'),
        ],
      ),
    ),
    Container(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF898989),
                      ),
                    ))
              ],
            ),
          )),
          _buildPageViewContainer(),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: OutlinedButton(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text(
                    'Next',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: kGreenColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
                onPressed: () {
                  if (_selectedIndex < pages.length - 1) {
                    setState(() {
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.bounceIn);
                      _selectedIndex++;
                    });
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLogo1() {
    return Container(
      child: Column(
        children: [
          Expanded(child: Image.asset('assets/images/logos/logo1.png')),
          Text('E Shopping')
        ],
      ),
    );
  }

  Widget _buildPageViewContainer() {
    return Container(
      color: Colors.red,
      height: MediaQuery.of(context).size.height / 2,
      child: PageView.builder(
        controller: _pageController,
        itemCount: pages.length,
        itemBuilder: (_, index) => Container(
          margin: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height / 2,
          color: Colors.white,
          child: pages[_selectedIndex],
        ),
      ),
    );
  }
}
