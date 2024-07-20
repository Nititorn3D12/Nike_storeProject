import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoeShop = [
            
    Shoe(
      name: 'Nike Dunk low Photon Dust', 
      price: '2,790', 
      description: 'ความสวยเรียบจากสไตล์ระดับตำนาน ',
      imagePart: 'lib/images/3.jpg',     
    
      ),
      
      Shoe(
       name: 'Nike Dunk low Knicks', 
      price: '3,500', 
      description: 'ความสวยเรียบจากสไตล์ระดับตำนาน ',
      imagePart: 'lib/images/4.jpg', 

      ),
      
      Shoe(
       name: ' Nike Dunk low Vintage Stealth Grey', 
      price: '6,000' , 
      description: 'ความสวยเรียบจากสไตล์ระดับตำนาน',
      imagePart: 'lib/images/5.jpg',  

       ),
      
      Shoe(
      name: 'Air jodan 1 Retro Low OG Black Toe ', 
      price: '5,300', 
      description: ' ความสวยเรียบจากสไตล์ระดับตำนาน',
      imagePart: 'lib/images/6.jpg',
  
      
      ),
      
      Shoe(
      name: 'Air jodan 1 Low Golf Copa ', 
      price: '6,990', 
      description: 'ความสวยเรียบจากสไตล์ระดับตำนาน ',
      imagePart: 'lib/images/7.jpg',  
   
      ),
      
      Shoe(
      name: 'Air jodan 1 Low White Aquatone  ', 
      price: '3,800', 
      description: ' ความสวยเรียบจากสไตล์ระดับตำนาน',
      imagePart: 'lib/images/8.jpg', 

      
      ),

      //หน้า accessory ที่ 2

                Shoe(
                name: 'Liverpool FC 2023/24 Match Home', 
                price: '4,600', 
                description: 'ความสวยเรียบจากสไตล์ระดับตำนาน ',
                imagePart: 'lib/photo/10.jpg',     
       
                ),
                
                Shoe(
                name: 'Nike Sportswear Futura', 
                price: '1,150', 
                description: 'ความสวยเรียบจากสไตล์ระดับตำนาน ',
                imagePart: 'lib/photo/11.jpg', 
          
                ),
                
                Shoe(
                name: ' Nike Everyday Essential', 
                price:  '600' , 
                description: 'ความสวยเรียบจากสไตล์ระดับตำนาน',
                imagePart: 'lib/photo/12.jpg',  
         
                ),
                
                Shoe(
                name: 'Liverpool FC Strike ', 
                price: '1,100' , 
                description: ' ความสวยเรียบจากสไตล์ระดับตำนาน',
                imagePart: 'lib/photo/13.jpg',
      
                
                ),
                
                Shoe(
                name: 'Nike ACG Aysén', 
                price: '2,079', 
                description: 'ความสวยเรียบจากสไตล์ระดับตำนาน ',
                imagePart: 'lib/photo/14.jpg',  
                
                
                ),
                
                Shoe(
                name: 'Nike Mercurial Superfly 9 Elite', 
                price: '11,100' , 
                description: ' ความสวยเรียบจากสไตล์ระดับตำนาน',
                imagePart: 'lib/photo/15.jpg', 
           
                
                )
            
                                  
                    
  
  
  
  ];

  List<Shoe> userCart = [];

  List<Shoe> getShoeList() {
    return shoeShop;
  }

  List<Shoe> getUserCart (){
    return userCart;
  }

  void addItemToCard(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }

  void clearCart() {}

  calculateTotalPrice() {}

}
