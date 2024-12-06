import 'package:ecommerce/CategoryBloc/CategoryBloc.dart';
import 'package:ecommerce/Login/login_bloc.dart';
import 'package:ecommerce/Prouct_Boc/prodcutbloc.dart';
import 'package:ecommerce/UserData/UserProfileBloc.dart';
import 'package:ecommerce/UserData/UserProfileEvent.dart';
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
import 'package:provider/provider.dart';

import 'Appconstants/Theme_manager.dart';

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
     ChangeNotifierProvider(create: (_)=>Theme_manager()),


   ], child: MyApp())

  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: context.watch<Theme_manager>().getThemevalue()
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home:SplashPage(),
    );
  }
}

