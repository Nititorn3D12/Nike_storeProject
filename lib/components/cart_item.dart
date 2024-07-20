import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/shoe.dart';
class CartItem extends StatefulWidget {
  final Shoe shoe;

  CartItem({
    required this.shoe,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void removeItemFromCart() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ลบไอเทม'),
          content: Text('คุณแน่ใจว่าจะลบออกจากกระเป๋า'),
          actions: [
            TextButton(
              child: Text('ยกเลิก'),
              onPressed: () {
                Navigator.of(context).pop();               },
            ),           
            TextButton(
              child: Text('ลบ'),
              onPressed: () {
                Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
                Navigator.of(context).pop(); 
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('ลบสำเร็จ'),
                    ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.only(bottom: 5),
      child: ListTile (
      leading: Image.asset(widget.shoe.imagePart),
      title: Text(widget.shoe.name),
      subtitle: Text(widget.shoe.price as String),
      trailing: IconButton(
        icon: Icon(Icons.delete_outline_sharp),
        onPressed: removeItemFromCart,
      ),
    ),
    );
  
  
  
  }
}
