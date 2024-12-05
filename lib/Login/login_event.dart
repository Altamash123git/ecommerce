abstract class loginUserEvent{

}

class LoginUser extends loginUserEvent{
  String email;
  String pass;

  LoginUser({required this.pass,required this.email});


}
