abstract class RegisterUserState{}

class RegisterInitialState extends RegisterUserState{}
class RegisterLoadingState extends RegisterUserState{}
class RegisterLoadedState extends RegisterUserState{}
class RegisterFailureState extends RegisterUserState{
  String errorMsg;
  RegisterFailureState({required this.errorMsg});
}

