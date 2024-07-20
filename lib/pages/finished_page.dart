// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_final/pages/intro_page.dart';
import 'package:project_final/pages/shop_page.dart';

class FinishedPage extends StatefulWidget {
  @override
  _FinishedPageState createState() => _FinishedPageState();
}
    
class _FinishedPageState extends State<FinishedPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

        
        @override
        
        void initState() {
          super.initState();
          _controller = AnimationController(
            vsync: this,
            duration: Duration(seconds: 10),
          )..repeat(reverse: true);
        }
          
        @override
        Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('เสร็จสิ้น'),
              leading: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => IntroPage()),
                  );
                },
              ),
              backgroundColor: Color.fromARGB(255, 83, 83, 83),
            ),
          
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 250.0,
                    height: 250.0,
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (BuildContext context, Widget? child) {
                        return Transform.rotate(
                           angle: _controller.value * (2 * pi),
                          child: Image.asset('lib/photo/1.jpg'), 
                           
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 100.0),
                    Text(
                      'การบันทึกเสร็จสิ้น \nกรุณารอสินค้าจัดส่ง\n\n',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Color.fromARGB(255, 0, 0, 0), 
                        fontWeight: FontWeight.bold, 
                        fontStyle: FontStyle.normal, 
                      ),
                      textAlign: TextAlign.center,
                    ),
                ],
              ),
            ),
          );
        }

        @override
        void dispose() {
          _controller.dispose();
          super.dispose();
        }
      }
