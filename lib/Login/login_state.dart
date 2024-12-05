abstract class LogInUserState{}



class LoginInitialState extends LogInUserState{}
class LoginLoadingState extends LogInUserState{}
class LoginSucessState extends LogInUserState{}
class LoginFailureState extends LogInUserState{
String errormsg;
LoginFailureState({required this.errormsg});
}

