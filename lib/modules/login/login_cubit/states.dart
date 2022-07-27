import 'package:petology/models/login_model.dart';

abstract class LoginStates
{}

class LoginInitialState extends LoginStates
{}

class LoginLoadingState extends LoginStates
{}

class LoginSuccessState extends LoginStates
{
  final LoginModel user;
  LoginSuccessState(this.user);
}

class LoginErrorState extends LoginStates
{
  final String error;
  LoginErrorState(this.error);
}