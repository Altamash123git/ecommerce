import 'package:ecommerce/Models/UserProfileData.dart';
import 'package:ecommerce/UserData/UserProfileEvent.dart';
import 'package:ecommerce/UserData/UserProfileState.dart';
import 'package:ecommerce/remote/api_helper.dart';
import 'package:ecommerce/remote/urls.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileBloc extends Bloc<UserProfileEvent,UserProfileState> {
  ApiHelper apiHelper;
  UserProfileBloc({required this.apiHelper}):super(UserProfileInitialState()){
    
    on<GetUserProfileEvent>((event,emit)async{
      try{
        
        emit(UserProfileLoadingState());
        var res= await apiHelper.PostApi(url: Urls.USER_PROFILE_URL);
        if(res["status"]=="true" || res["status"]){
          emit(UserProfileLoadedState(data: UserData.fromJson(res)));

        }else{
          emit(UserProfileErrorState(errorMsg: res["message"]));

        }
      }catch(e){
        emit(UserProfileErrorState(errorMsg: e.toString()));
      }
    });
  }
}