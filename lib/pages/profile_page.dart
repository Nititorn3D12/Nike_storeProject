// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_final/pages/finished_page.dart';
import 'package:project_final/pages/qrcode_page.dart';
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("ที่อยู่ในการจัดส่ง"),
          backgroundColor: Color.fromARGB(255, 73, 73, 73),       
     actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("ข้อมูล !!!!! "),
                    content: Text("การจัดส่งค่อนข้างใช้เวลาล่าช้าในการขนส่งกรุณารอสินค้าสักระยะในการจัดส่งนะจ๊ะ"),
                    actions: [
                      TextButton(
                        child: Text("ปิด"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
    ),
          body: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [           
            Image.asset(
            'lib/images/10.png',
            height: 250,
            width: 250,
            fit: BoxFit.cover,
          ),
            buildTextFields(),
          ],
        ),
      ),

    
    floatingActionButton: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("ยืนยัน"),
                content: Text("ยืนยันการสั่งซื้อสินค้า"),
                actions: [
                  TextButton(
                    child: Text("ปิด"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text("ยืนยัน"),
                    onPressed: () {
                      Navigator.of(context).pop(); 
                      Navigator.of(context).push(
                    MaterialPageRoute(
                    builder: (context) => QrcodePage(),
                              ),
                            );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('ทำการสั่งซื้อสำเร็จ !!!! กรุณาชำระเงิน'),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Text('ยืนยัน'),     
      ),
  );
}
      
    
  Widget buildTextFields() => Padding(
        padding: const EdgeInsets.all(35),
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTextField1(),
              heightSpacer(15),
              buildTextField2(),
              heightSpacer(15),
              buildTextField3(),
              heightSpacer(15),
              buildTextField4(),
              heightSpacer(15),
              buildTextField5(),
            ],
          ),
        ),
      );

        
  Widget buildTextField1() => TextFormField(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(5.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.red,
          ),
          filled: true,
           fillColor: Colors.red[50],
          labelText: "กรุณากรอกชื่อ - นามสกุล ",
          labelStyle: TextStyle(color: Colors.red),
        ),
      );

      

      Widget buildTextField2 () => TextFormField(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(5.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
            ),
          ),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.orange,
          ),
          filled: true,
          fillColor: Colors.orange[50],
          labelText: "กรุณากรอกที่อยู่",
          labelStyle: TextStyle(color: Colors.orange),
        ),
      );

Widget buildTextField3() => TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(     
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(5.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 217, 217, 5),
            ),
          ),
          prefixIcon: Icon(
            Icons.person,
            color: const Color.fromARGB(255, 217, 217, 5),
          ),
          filled: true,
          fillColor: Colors.yellow[50],
          labelText: "กรุณากรอกเบอร์โทรศัพท์",
          labelStyle: TextStyle(color: const Color.fromARGB(255, 217, 217, 5)),
        ),
      );

  Widget buildTextField4() => TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(5.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green,
            ),
          ),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.green,
          ),
          filled: true,
          fillColor: Colors.green[50],
          labelText: "กรุณากรอกรหัสไปรษนีย์",
          labelStyle: TextStyle(color: Colors.green),
        ),
      );

  Widget buildTextField5() => TextFormField(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(5.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.blue,
          ),
          filled: true,
          fillColor: Colors.blue[50],
          labelText: "กรุณากรอก Email",
          labelStyle: TextStyle(color: Colors.blue),
        ),
      );


      
  Widget heightSpacer(double myHeight) => SizedBox(height: myHeight);
}

class QrPage {
}
