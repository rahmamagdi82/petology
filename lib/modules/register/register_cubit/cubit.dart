import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/login_model.dart';
import '../../../shared/network/endPoints.dart';
import '../../../shared/network/remote/dio_helper.dart';
import 'states.dart';


class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context)=>BlocProvider.of(context);

  String? selectedItem;
  void selectedCountry(String? value)
  {
    selectedItem=value;
    emit(SelectCountryState());
  }
  LoginModel? accessToken;
  void userRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String country,
  }){
    emit(RegisterLoadingState());
    DioHelper.postData(
        url: REGISTR,
        data: {
          "firstName":firstName,
          "lastName":lastName,
          "email":email,
          "password":password,
          "country":country,
        }).then((value) {
      accessToken=LoginModel.fromJson(value.data);
      emit(RegisterSuccessState(accessToken!));
    }).catchError((error){
      emit(RegisterErrorState());
      print(error.toString());
    });
  }
}