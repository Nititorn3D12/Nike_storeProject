// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import "package:flutter/material.dart";
import 'package:project_final/pages/profile_page.dart';
import "package:project_final/pages/shop_page.dart";
import "package:provider/provider.dart";

import "../components/cart_item.dart";
import "../models/cart.dart";
import "../models/shoe.dart";

class CartPage extends StatelessWidget {
   const CartPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            Text(
              'รายการสั่งซื้อสินค้า',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context, index) {
                  Shoe individualShoe = value.getUserCart()[index];
                  return CartItem(shoe: individualShoe);
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('ยืนยันการสั่งสินค้า'),
                            content: Text('คุณต้องการยืนยันการสั่งสินค้าหรือไม่?'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('ยกเลิก'),
                                onPressed: () {
                                  Navigator.of(context).pop(); 
                                },
                              ),
                              TextButton(
                                child: Text('ยืนยัน'),
                                onPressed: () async {
                                  Navigator.of(context).pop(); 
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProfilePage(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('ยืนยันการสั่งสินค้า'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () async {
                      bool confirmed = await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('ยืนยันการลบรายการ'),
                            content: Text('คุณต้องการลบรายการทั้งหมดใช่หรือไม่?'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('ยกเลิก'),
                                onPressed: () {
                                  Navigator.of(context).pop(); 
                                },
                              ),
                              TextButton(
                                child: Text('ตกลง'),
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                              ),
                            ],
                          );
                        },
                      );

                      if (confirmed) {
                        List<Shoe> userCart = List.from(value.getUserCart());
                        for (Shoe individualShoe in userCart) {
                          value.removeItemFromCart(individualShoe);
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('ยกเลิกการสั่งซื้อเสร็จสิ้น'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: Text('ยกเลิกการสั่งสินค้า'),
                  ),
                ],
              ),
            ),
          ]    
        )
      )
    );
  
  }
}
