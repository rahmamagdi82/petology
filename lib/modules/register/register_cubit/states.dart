import '../../../models/login_model.dart';

abstract class RegisterStates
{}

class RegisterInitialState extends RegisterStates
{}

class RegisterLoadingState extends RegisterStates
{}

class RegisterSuccessState extends RegisterStates
{
  final LoginModel user;
  RegisterSuccessState(this.user);
}

class RegisterErrorState extends RegisterStates
{}

class SelectCountryState extends RegisterStates
{}