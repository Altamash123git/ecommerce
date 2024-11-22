import 'package:ecommerce/ui/logInPage.dart';
import 'package:ecommerce/ui/nav_page.dart';
import 'package:flutter/material.dart';

import '../Appconstants/colors.dart';
import '../utils/decoration.dart';

class Signinpage extends StatefulWidget {

  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  TextEditingController nameController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController phoneController= TextEditingController();
  TextEditingController pswrdContoller= TextEditingController();
  TextEditingController repswrdController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text("Sign In",style: mTextStyle22(mcolor: AppColors.secondary,mFontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: "Enter your good name...",
                  label: Text("Name"),
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
              controller: phoneController,
              decoration: InputDecoration(
                  hintText: "Enter your mobile no...",
                  label: Text("Mobile No"),
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
              controller: pswrdContoller,
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
            SizedBox(height: 8,),
            TextField(
              controller: repswrdController,
              decoration: InputDecoration(
                  hintText: "Confirm your pswrd...",
                  hintStyle: mTextStyle14(),
                  label: Text("rePassword"),
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
            SizedBox(height: 18,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    elevation: 11,
                    shadowColor: AppColors.primaryColor
                ),

                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>NavPage()));
                }, child: Text("Sign In",style: mTextStyle18(),)),
            TextButton(

                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>LogInPage()));
                }, child: Text("Already have an Account? Login Instead",style: mTextStyle18(mcolor: Colors.blue),))
          ],
        ),
      )),
    );
  }
}
