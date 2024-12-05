import 'package:bloc/bloc.dart';
import 'package:ecommerce/Models/view_cart_model.dart';
import 'package:ecommerce/remote/api_helper.dart';
import 'package:ecommerce/remote/urls.dart';
import 'package:ecommerce/view_cart/ViewCartEvent.dart';
import 'package:ecommerce/view_cart/ViewCartState.dart';

class ViewCartBloc extends Bloc<ViewCartEvent,ViewCartState>{
  ApiHelper apiHelper;
  ViewCartBloc({required this.apiHelper}):super(ViewCartInitialState()){
    
    on<ViewMyCartEvent>((event,emit)async{
      emit(ViewCartLoadingState());
      
      try{
        var res= await apiHelper.getApi(url: Urls.FETCH_CART_URL);
        
        if(res["status"]=="true"||res["status"]){
          emit(ViewCartLoadedState(mcart: CartModel.fromJson(res)));
        }else{
          emit(ViewCartErrorState(errorMsg: res["message"]));
        }
      }catch(e){
        emit(ViewCartErrorState(errorMsg: e.toString()));
      }
      
    });
  }
}