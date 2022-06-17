// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables , prefer_final_fields

import 'package:flutter/material.dart';
import '../constants.dart';

class ProfileScreen extends StatelessWidget {
  static String RouteName = '/ProfileScreen';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        child: ListView(
          children: [
            _buildCustomListTile(icon: Icons.shopping_bag_rounded, title: 'My orders'),
            Divider(height: 0),
            _buildCustomListTile(icon: Icons.favorite, title: 'Favorites'),
            Divider(height: 0),
            _buildCustomListTile(icon: Icons.settings, title: 'Settings'),
            Divider(height: 0),
            _buildCustomListTile(icon: Icons.shopping_cart, title: 'My Cart'),
            Divider(height: 0),
            _buildCustomListTile(icon: Icons.rate_review_outlined, title: 'Rate us'),
            Divider(height: 0),
            _buildCustomListTile(icon: Icons.share, title: 'Refer a Friend'),
            Divider(height: 0),
            _buildCustomListTile(icon: Icons.help, title: 'Help'),
            Divider(height: 0),
            _buildCustomListTile(icon: Icons.logout, title: 'Log Out'),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomListTile(
      {required IconData icon, required String title, Function? func}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.6),
      child: Row(
        children: [
          Icon(
            icon,
            color: kGreenColor,
            size: 26,
          ),
          SizedBox(
            width: 20,
          ),
          Text(title),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      toolbarHeight: 180,
      centerTitle: true,
      elevation: 0,
      title: Column(
        children: [
          _buildProfilePicture(),
          Text(
            'Emilie Vernad',
            style: kTitleTextstyle,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'emilie.v@gmail.com',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit_outlined),
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 20)),
      ],
    );
  }

  Widget _buildProfilePicture() {
    return Container(
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.only(top: 5, bottom: 10),
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: CircleAvatar(
        backgroundColor: Colors.yellow,
        backgroundImage: AssetImage('assets/images/profile.jpg'),
      ),
    );
  }
}
