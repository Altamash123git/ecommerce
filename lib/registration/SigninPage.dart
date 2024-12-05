import 'package:ecommerce/registration/registration_bloc.dart';
import 'package:ecommerce/registration/registration_event.dart';
import 'package:ecommerce/registration/registration_state.dart';
import 'package:ecommerce/Login/logInPage.dart';
import 'package:ecommerce/ui/nav_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Appconstants/colors.dart';
import '../utils/decoration.dart';

class Signinpage extends StatefulWidget {
  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pswrdContoller = TextEditingController();
  TextEditingController repswrdController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Sign In",
          style: mTextStyle22(
              mcolor: AppColors.secondary, mFontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
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
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide:
                            BorderSide(width: 2, color: AppColors.secondary))),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                    hintText: "Enter your mobile no...",
                    label: Text("Mobile No"),
                    hintStyle: mTextStyle14(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide:
                            BorderSide(width: 2, color: AppColors.secondary))),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: "Enter your email...",
                    label: Text("Email"),
                    hintStyle: mTextStyle14(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide:
                            BorderSide(width: 2, color: AppColors.secondary))),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                controller: pswrdContoller,
                decoration: InputDecoration(
                    hintText: "Enter Password...",
                    hintStyle: mTextStyle14(),
                    label: Text("Password"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide:
                            BorderSide(width: 2, color: AppColors.secondary))),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                controller: repswrdController,
                decoration: InputDecoration(
                    hintText: "Confirm your pswrd...",
                    hintStyle: mTextStyle14(),
                    label: Text("rePassword"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(
                        width: 2,
                        color: AppColors.secondary,
                      ),
                    )),
              ),
              SizedBox(
                height: 18,
              ),
              BlocListener<RegisterUserBloc, RegisterUserState>(
                listener: (context, state) {
                  if (state is RegisterLoadingState) {
                    isLoading = true;
                    setState(() {});
                  }
                  if (state is RegisterLoadedState) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Ussr register Successfully")));
                    setState(() {});
                  }
                  if (state is RegisterFailureState) {
                    isLoading = false;
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${state.errorMsg} ')));
                    setState(() {});
                  }
                },
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        elevation: 11,
                        shadowColor: AppColors.primaryColor),
                    onPressed: () {
                      if (nameController.text.isNotEmpty &&
                          pswrdContoller.text.isNotEmpty &&
                          repswrdController.text.isNotEmpty &&
                          emailController.text.isNotEmpty &&
                          phoneController.text.isNotEmpty) {
                        if (pswrdContoller.text == repswrdController.text) {
                          context.read<RegisterUserBloc>().add(CreateUserEvent(
                              name: nameController.text,
                              mobNo: phoneController.text,
                              email: emailController.text,
                              pass: pswrdContoller.text));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                            "Password doesn't match",
                            style: mTextStyle18(mcolor: Colors.red),
                          )));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          "please fill all required fields!!",
                          style: mTextStyle18(mcolor: Colors.red),
                        )));
                      }

                      //Navigator.push(context, MaterialPageRoute(builder: (_)=>NavPage()));
                    },
                    child: isLoading
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                "Registering",
                                style: mTextStyle18(),
                              )
                            ],
                          )
                        : Text(
                            "Sign In",
                            style: mTextStyle18(),
                          )),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LogInPage()));
                  },
                  child: Text(
                    "Already have an Account? Login Instead",
                    style: mTextStyle18(mcolor: Colors.blue),
                  )),
            ],
          ),
        )),
      ),
    );
  }
}
