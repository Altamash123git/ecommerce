import 'package:ecommerce/cart/CartState.dart';
import 'package:ecommerce/cart/cartEvent.dart';
import 'package:ecommerce/remote/api_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../remote/urls.dart';

class CartBloc extends Bloc<CartEvent,CartState>{
  ApiHelper apiHelper;
  CartBloc({required this.apiHelper}):super(CartInitialState()){
    on<AddToCartEvent>((event,emit)async{
      emit(CartLoadingState());
      try{
         var res= await apiHelper.PostApi(url: Urls.ADD_TO_CART_URL,

             mBodyParams: {"product_id": event.productId, "quantity": event.qty}
      );
         if(res["status"]=="true" || res["status"]){
           emit(CartLoadedState());
         }else{
           emit(CartErrorState(errorMsg: res["message"]));
         }

      }catch(e){
        emit(CartErrorState(errorMsg: e.toString()));
      }
    });


  }
}