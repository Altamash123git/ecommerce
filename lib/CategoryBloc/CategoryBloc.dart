import 'package:ecommerce/CategoryBloc/CategoryEvent.dart';
import 'package:ecommerce/CategoryBloc/CategoryState.dart';
import 'package:ecommerce/Models/categoryModel.dart';
import 'package:ecommerce/remote/api_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../remote/urls.dart';

class CategoryBloc extends Bloc<CategoryEvent,CategoryState>{
  ApiHelper apiHelper;
  CategoryBloc({required this.apiHelper}): super(CategorynItialState()){
    on<GetAllCategoryData>((event,emit) async{
      emit(CategoryLoadingState());
      
      try{
        var res= await apiHelper.getApi(url: Urls.GET_CATEGORY_URL);

        if(res["status"]){
          emit(CategoryLoadedState(mdata: CategoryModel.fromJson(res)));
        }
        
      }catch(e){
        emit(CategoryErrorState(erroMsg: e.toString()));
      }
      
    });
  }
  
}