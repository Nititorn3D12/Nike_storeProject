import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


  class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
   MyBottomNavBar ({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      
      child: GNav( 
        color: const Color.fromARGB(255, 0, 0, 0),
        activeColor: const Color.fromARGB(255, 255, 255, 255),
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Color.fromARGB(255, 85, 85, 85), 
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 5,
        onTabChange: (value) => onTabChange!(value), 
        tabs: const [
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: 'รองเท้า',
          ),
           GButton(
            icon: Icons.shopping_bag_outlined,
            text: 'อุปกรณ์เสริม',
           ),
          GButton(
            icon: Icons.production_quantity_limits_outlined,
            text: 'ตะกร้า',
           ),
        ]),
    );
  }
}

