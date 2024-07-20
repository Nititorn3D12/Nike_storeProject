// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_final/pages/Finished_page.dart';
import 'package:project_final/pages/intro_page.dart';
import 'package:project_final/pages/shop_page.dart';

class QrcodePage extends StatefulWidget {
  @override
  _QrcodePageState createState() => _QrcodePageState();
}

class _QrcodePageState extends State<QrcodePage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ชำระเงิน'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromARGB(255, 112, 112, 112), // Shopee uses orange as their primary color
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Delivery Options
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ตัวเลือกการจัดส่ง',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DropdownButton<String>(
                  items: <String>['Standard', 'Kerry', 'JT Express'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                  },
                  value: 'Standard', 
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ใช้โค้ดส่วนลด',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add code to apply discount
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  child: Text('ใช้โค้ด'),
                ),
              ],
            ),
            SizedBox(height: 20.0),

            Container(
              height: 250.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/images/20.png'),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'สแกน QrCode เพื่อชำระเงิน',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            Text(
              'กรุณารอยืนยันการชำระเงิน',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FinishedPage()),                
                );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('ทำการสั่งซื้อสำเร็จ !!!! กรุณาชำระเงิน'),
                ),
              );             
              },
              
              style: ElevatedButton.styleFrom(
                primary: Colors.orange, 
                textStyle: TextStyle(fontSize: 20),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text('ยืนยันการชำระเงิน'),
            ),
             
          ],
        ),
      ),
    );
  }
}
