import 'package:bloc/bloc.dart';
import 'package:ecommerce/registration/registration_event.dart';
import 'package:ecommerce/registration/registration_state.dart';
import 'package:ecommerce/remote/api_helper.dart';

import '../remote/api_exception.dart';
import '../remote/urls.dart';

class RegisterUserBloc extends Bloc<RegisterUserEvent, RegisterUserState> {
  ApiHelper apiHelper;

  RegisterUserBloc({required this.apiHelper}) : super(RegisterInitialState()) {
    on<CreateUserEvent>((event, emit) async {
      emit(RegisterLoadingState());
      try {
        var res = await apiHelper.PostApi(
          url: Urls.REGISTER_URL,
          isHeaderrequired: false,
          mBodyParams: {
            "name": event.name,
            "password": event.pass,
            "mobile_number": event.mobNo,
            "email": event.email,
          },
        );

        if (res["status"]) {
          emit(RegisterLoadedState());
          print(res["status"]);
        } else {
          emit(RegisterFailureState(errorMsg: res["message"]));
        }
      } catch (e) {
        if (e is ApiException) {
          emit(RegisterFailureState(errorMsg: e.toErrorMsg()));
        } else {
          emit(RegisterFailureState(errorMsg: "An unexpected error occurred"));
        }
        print("Error: $e");
      }
    });
  }
}
