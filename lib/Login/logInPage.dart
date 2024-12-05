import 'package:ecommerce/Appconstants/colors.dart';
import 'package:ecommerce/Login/login_bloc.dart';
import 'package:ecommerce/Login/login_event.dart';
import 'package:ecommerce/Login/login_state.dart';
import 'package:ecommerce/registration/SigninPage.dart';
import 'package:ecommerce/ui/nav_page.dart';
import 'package:ecommerce/utils/decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInPage extends StatefulWidget {
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage>{
  TextEditingController emailController=TextEditingController();
  TextEditingController pswrdController= TextEditingController();
  bool isLoading=false;
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
           BlocListener<LoginBloc,LogInUserState>(
             listener: (context,state){
               if(state is LoginLoadingState){
                 isLoading= true;
                 setState(() {

                 });
               }
               if(state is LoginSucessState){
                 Navigator.push(context, MaterialPageRoute(builder: (_)=>NavPage()));
                //Navigator.
                 //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Ussr register Successfully")));
                 setState(() {

                 });
               }

               if(state is LoginFailureState){
                 isLoading= false;
                 ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text('${state.errormsg} ')));
                 setState(() {});

               }
             },
             child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                     backgroundColor: AppColors.secondary,
                     elevation: 11,
                     shadowColor: AppColors.primaryColor
                 ),
                 onPressed: (){

                   if(emailController.text.isNotEmpty&&pswrdController.text.isNotEmpty){
                     context.read<LoginBloc>().add(LoginUser(pass: pswrdController.text, email: emailController.text));
                   }else{
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please fill all required fields!!",style: mTextStyle18(mcolor: Colors.red),)));
                   }

                 }, child:isLoading?Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 CircularProgressIndicator(),
                 SizedBox(width: 7,

                 ),
                 Text("Logining",style: mTextStyle18(),)
               ],
             ): Text("Log In ",style: mTextStyle18(),)),
           ),
           TextButton(

               onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (_)=>Signinpage()));

           }, child: Text("New user? create account",style: mTextStyle18(mcolor: Colors.blue),)),

         ],
       ),
     )),
   );
  }
}
