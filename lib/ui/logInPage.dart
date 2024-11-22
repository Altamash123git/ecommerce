import 'package:ecommerce/Appconstants/colors.dart';
import 'package:ecommerce/ui/SigninPage.dart';
import 'package:ecommerce/ui/nav_page.dart';
import 'package:ecommerce/utils/decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage>{
  TextEditingController emailController=TextEditingController();
  TextEditingController pswrdController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       backgroundColor: AppColors.primaryColor,
       title: Text("Log In ",style: mTextStyle22(mcolor: AppColors.secondary),),
       centerTitle: true,
     ),
     body: SafeArea(child: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           TextField(
             controller: emailController,
             decoration: InputDecoration(
                 hintText: "Enter your email...",
                 label: Text("Email"),
                 hintStyle: mTextStyle14(),
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(11),
                   borderSide: BorderSide(color: Colors.transparent,width: 2),

                 ),
                 focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(11),
                     borderSide: BorderSide(
                         width: 2,
                         color: AppColors.secondary
                     )
                 )
             ),

           ),
           SizedBox(height: 8,),
           TextField(
             controller: pswrdController,
             decoration: InputDecoration(
                 hintText: "Enter Password...",
                 hintStyle: mTextStyle14(),
                 label: Text("Password"),
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(11),
                   borderSide: BorderSide(color: Colors.transparent,width: 2),

                 ),
                 focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(11),
                     borderSide: BorderSide(
                         width: 2,
                         color: AppColors.secondary
                     )
                 )
             ),

           ),
           SizedBox(
             height: 18,
           ),
           ElevatedButton(
               style: ElevatedButton.styleFrom(
                   backgroundColor: AppColors.secondary,
                   elevation: 11,
                   shadowColor: AppColors.primaryColor
               ),
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (_)=>NavPage()));
               }, child: Text("Log In ",style: mTextStyle18(),)),
           TextButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (_)=>Signinpage()));

           }, child: Text("New user? create account",style: mTextStyle18(mcolor: Colors.blue),)),

         ],
       ),
     )),
   );
  }
}
