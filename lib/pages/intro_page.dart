import 'package:flutter/material.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

 
 void handleLogout(BuildContext context) {
 
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
  );
}
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center (
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset(
                  'lib/images/2.png',
                  height: 230,                
                ),
              ),        
              const Text(
                'Just Do It',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
           
              const SizedBox(height: 20),
           
              const Text(
                'Sneakers for You On Your life ',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
           
              const SizedBox(height: 20),


            GestureDetector(
              onTap:() => Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                  ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12),               
                ),
                padding: const EdgeInsets.all(25),
                child: const Center(
                  child:  Text(
                    'Shop Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,                   
                      ),                   
                    ),
                )
              ),
            ),
           ],
          ),
        ),
      ),
    );
  }
}