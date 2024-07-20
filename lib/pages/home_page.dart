// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_final/components/bottom_nav_bar.dart';
import 'package:project_final/pages/Finished_page.dart';
import 'package:project_final/pages/profile_page.dart';
import 'package:project_final/pages/qrcode_page.dart';
import 'package:project_final/pages/shop_page.dart';
import 'package:project_final/pages/sock_page.dart';
import 'package:project_final/pages/intro_page.dart';
import 'cart_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() =>_HomepageState();
}

class _HomepageState extends State<HomePage>{
  
  
  int _selectedIndex = 0;



  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  

  final List<Widget> _pages = [
    ShopPage(),
    SockPage(),
    const CartPage(),
    ProfilePage(),
    QrcodePage(),
    FinishedPage(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 219, 217, 217),
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        elevation: 0,
        leading: Builder (
        builder:  (context)  => IconButton(
          icon: Padding(
            padding: const EdgeInsets.only(left:12.0),
            child: const Icon(Icons.menu),
          ),
          color: const Color.fromARGB(255, 87, 87, 87),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          } ,
        ),),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [                
            DrawerHeader(
              child: Image.asset(
                'lib/images/9.jpg'
                 ),                                          
              ),         
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Divider(
                  color: Color.fromARGB(255, 202, 202, 202),                   
                   ),
              ),                 
          

            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).pop(); 
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => IntroPage(), 
                    ),
                  );
                },
              ),
            ),

             Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.info_outline_rounded,
                  color: Colors.white,
                ),
                title: Text(
                  'about',
                  style: TextStyle(color: Colors.white),
                ),                                             
              ),
            ),
          ],
        ),
           
          
            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 25 ),
              child: ListTile(
                leading: Icon(
                  Icons.logout_rounded,
                  color: Colors.white,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),               
                ), 
                onTap: () {
                  Navigator.of(context).pop(); 
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => IntroPage(), 
                    ),
                  );
                },               
              ),
            )
          
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
