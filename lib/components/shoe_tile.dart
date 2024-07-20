  // ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, unnecessary_string_escapes

  import 'package:flutter/material.dart';
  import 'package:project_final/models/shoe.dart';
  import 'package:project_final/models/cart.dart';
  import 'package:provider/provider.dart';
  
  class ShoeTile extends StatefulWidget {
    final Shoe shoe;
    final void Function()? onTap;

    ShoeTile({super.key, required this.shoe, required this.onTap });

    @override
    _ShoeTileState createState() => _ShoeTileState();
  }

  class _ShoeTileState extends State<ShoeTile> {
    int quantity = 1;
    bool isFavorite = false;
    
    
    void toggleFavorite() {
      setState(() {
        isFavorite = !isFavorite;
      });
    }

    void incrementQuantity() {
      setState(() {
        quantity++;
      });
    }

    void decrementQuantity() {
      if (quantity > 1) {
        setState(() {
          quantity--;
        });
      }
    }



    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9.0),
          child: Container(
            margin: EdgeInsets.only(left: 25),
            width: 280,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(widget.shoe.imagePart),
                      ),
                    ),
                  
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.shoe.name,                           
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            '\฿' + widget.shoe.price,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                      const SizedBox(height: 100,),
                
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: incrementQuantity,
                        icon: Icon(Icons.add),
                      
                      ),
                      Text(
                        quantity.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: decrementQuantity,
                        icon: Icon(Icons.remove),
                      ),
                    ],
                  ),
                ),
                
                
                Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("ยืนยันในการซื้อ"),
                          content: Text("แน่ใจแล้วใช่มั้ยว่าจะซื้อ "),
                          actions: [
                            TextButton(
                              child: Text("Cancel"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          TextButton(
                          child: Text('ยืนยัน'),
                          onPressed: () {
                            Provider.of<Cart>(context, listen: false).addItemToCard(widget.shoe);
                            Navigator.of(context).pop(); 

                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('ทำการสั่งซื้อสำเร็จ'),
                                ),
                            );
                          },
                        ),
                          ],
                        );
                      },
                    );
                  },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(10),
                        ),
                    ),
                  child: Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),

              Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: widget.onTap,
                    child: Container(
                    ),
                  ),
                ),
                              
              Align(
                  alignment: Alignment.topRight, 
                  child: IconButton(
                    onPressed: toggleFavorite,
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Color.fromARGB(255, 17, 16, 16),
                    ),
                  ),
                ),
            
            
            ],
            ),
          ),
        ),
      );
    }
  }
