import 'package:bloc/bloc.dart';
import 'package:ecommerce/Appconstants/keysConstant.dart';
import 'package:ecommerce/Login/login_event.dart';
import 'package:ecommerce/Login/login_state.dart';
import 'package:ecommerce/remote/api_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../remote/urls.dart';

class LoginBloc extends Bloc<loginUserEvent,LogInUserState>{
  ApiHelper apiHelper;
  LoginBloc({required this.apiHelper}): super(LoginInitialState()){
    on<LoginUser>((event,emit)async{
      emit(LoginInitialState());
      try{
        var res= await apiHelper.PostApi(url: Urls.LOGIN_URL,
        mBodyParams: {
          "email":event.email,
          "password":event.pass,
        }
        );
        if(res["status"]){
          emit(LoginSucessState());
          String token= res["tokan"];
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(AppKeyConstants.TokenKey, token);

        }else{
          emit(LoginFailureState(errormsg: res["message"]));
        }

      }catch(e){
        emit(LoginFailureState(errormsg: e.toString()));
      }

    });
  }
}