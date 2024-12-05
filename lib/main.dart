import 'package:ecommerce/CategoryBloc/CategoryBloc.dart';
import 'package:ecommerce/Login/login_bloc.dart';
import 'package:ecommerce/Prouct_Boc/prodcutbloc.dart';
import 'package:ecommerce/UserData/UserProfileBloc.dart';
import 'package:ecommerce/UserData/UserProfileState.dart';
import 'package:ecommerce/cart/cartBloc.dart';
import 'package:ecommerce/create_order/create_order_bloc.dart';
import 'package:ecommerce/getAllOrderBloc/getALLorderBloc.dart';
import 'package:ecommerce/registration/SigninPage.dart';
import 'package:ecommerce/registration/registration_bloc.dart';
import 'package:ecommerce/remote/api_helper.dart';
import 'package:ecommerce/ui/cart_page.dart';
import 'package:ecommerce/ui/detail_page.dart';
import 'package:ecommerce/ui/homepage.dart';
import 'package:ecommerce/ui/nav_page.dart';
import 'package:ecommerce/ui/profilePage.dart';
import 'package:ecommerce/ui/splash_page.dart';
import 'package:ecommerce/utils/custom%20widget.dart';
import 'package:ecommerce/view_cart/ViewCartBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  return runApp(

   MultiBlocProvider(providers: [
     BlocProvider<RegisterUserBloc>(create: (context)=>RegisterUserBloc(apiHelper: ApiHelper())),

     BlocProvider(create: (context)=>LoginBloc(apiHelper: ApiHelper())),

     BlocProvider(create: (context)=>ProductBloc(apiHelper: ApiHelper())),
     BlocProvider(create: (context)=>CategoryBloc(apiHelper: ApiHelper())),
     BlocProvider(create: (context)=>CartBloc(apiHelper: ApiHelper())),

     BlocProvider(create: (context)=>ViewCartBloc(apiHelper: ApiHelper())),
     BlocProvider(create: (context)=>CreateOrderBloc(apiHelper: ApiHelper())),
     BlocProvider(create: (context)=>GetAllOrderBloc(apiHelper: ApiHelper())),
     BlocProvider(create: (context)=>UserProfileBloc(apiHelper: ApiHelper())),



   ], child: MyApp())

  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:SplashPage(),
    );
  }
}
class UserDataShow extends StatefulWidget {
  const UserDataShow({super.key});

  @override
  State<UserDataShow> createState() => _UserDataShowState();
}

class _UserDataShowState extends State<UserDataShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserProfileBloc,UserProfileState>(builder: (context,state){

        if(state is UserProfileLoadedState){
          return ListView.builder(itemBuilder: (_,index){});
        }
        return Container();
      }),
    );
  }
}
