import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/login_model.dart';
import '../../../shared/network/endPoints.dart';
import '../../../shared/network/remote/dio_helper.dart';
import 'states.dart';



class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context)=>BlocProvider.of(context);

LoginModel? accessToken;
  void userLogin({
    required String email,
    required String password,
  }){
    emit(LoginLoadingState());
    DioHelper.postData(
        url: LOGIN,
        data: {
          "email":email,
          "password":password,
        }).then((value) {
      accessToken=LoginModel.fromJson(value.data);
      print(accessToken!.token);
      emit(LoginSuccessState(accessToken!));
    }).catchError((error){
      emit(LoginErrorState(error.toString()));
      print(error.toString());
    });
  }
}