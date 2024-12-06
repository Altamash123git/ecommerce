import 'package:ecommerce/registration/SigninPage.dart';
import 'package:ecommerce/ui/OrderPage.dart';
import 'package:ecommerce/ui/cart_page.dart';
import 'package:ecommerce/ui/detail_page.dart';
import 'package:ecommerce/ui/favourite.dart';
import 'package:ecommerce/ui/homepage.dart';
import 'package:ecommerce/Login/logInPage.dart';
import 'package:ecommerce/ui/profilePage.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int currindx=0;
  List pages =[HomePage(),MyOrderPage(),CartScreen(),profilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currindx],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
      FloatingActionButton(
        shape:CircleBorder(),
        backgroundColor: Colors.deepOrange,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder:(_)=>HomePage()));
        },child: Icon(Icons.home,color: Colors.white,),),
      bottomNavigationBar: BottomAppBar(

        shape: CircularNotchedRectangle(),
        notchMargin: 12.0,
        elevation: 11,
        shadowColor: Colors.blueAccent,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
        IconButton(
        icon: Icon(Icons.add_box_outlined,size: 30,),

        onPressed: () {
          setState(() {
            currindx=0;
          });
        },
      ),
      IconButton(
        icon: Icon(Icons.favorite_outline),
        onPressed: () {
          setState(() {
            currindx=1;
          });
        },
      ),
      SizedBox(width: 40), // Space for the FAB
      IconButton(
        icon: Icon(Icons.shopping_cart_outlined,size: 30,),
        onPressed: () {
          setState(() {
            currindx=2;
          });
        },
      ),
      IconButton(
        icon: Icon(Icons.person_outline,size: 30,),
        onPressed: () {
          setState(() {
            currindx=3;
          });
        },
      ),]
        ),
      )


    );

  }

}
