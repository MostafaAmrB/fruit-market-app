// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables , prefer_final_fields
import 'package:flutter/material.dart';
import 'package:fruit_market_final/constants.dart';

class EntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: kGreenColor,
      body: Stack(
        children: [
          Positioned(
            bottom: (MediaQuery.of(context).size.height / 2) + 100,
            left: 0,
            right: 0,
            child: Text(
              'Fruit Market',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 280,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/entryscreen.png',
                  fit: BoxFit.fitWidth,
                ),
              ))
        ],
      ),
    );
  }
}
