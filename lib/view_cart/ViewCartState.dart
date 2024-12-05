 import 'package:ecommerce/Models/view_cart_model.dart';

abstract class ViewCartState{}


 class ViewCartInitialState extends ViewCartState{}
 class ViewCartLoadingState extends ViewCartState{}
 class ViewCartLoadedState extends ViewCartState{

  CartModel mcart;
  ViewCartLoadedState({required this.mcart});

 }

 class ViewCartErrorState extends ViewCartState{

  String errorMsg;
  ViewCartErrorState({required this.errorMsg});
 }

