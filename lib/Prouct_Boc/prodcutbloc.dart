import 'package:bloc/bloc.dart';
import 'package:ecommerce/Models/productModel.dart';
import 'package:ecommerce/Prouct_Boc/productEvent.dart';
import 'package:ecommerce/Prouct_Boc/productState.dart';
import 'package:ecommerce/remote/api_helper.dart';

import '../remote/urls.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>{
ApiHelper apiHelper;
ProductBloc({required this.apiHelper}):super(ProductInitialState()){
  on<GetAllProductEvent>((event,emit)async{
    emit(ProductLoadingState());
    try{
      var res= await apiHelper.PostApi(url: Urls.GET_PRODUCT_URL);

      if(res["status"]){
        emit(ProductLoadedState(mData: ProductDataModel.fromJson(res)));
      }

    }catch(e){
      emit(ProductErrorState(errorMsg: e.toString()));
    }

  });
}

}