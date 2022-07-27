import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology/models/needs_model.dart';
import 'package:petology/modules/about_us.dart';

import '../../../models/first_section-model.dart';
import '../../../models/information_model.dart';
import '../../network/endPoints.dart';
import '../../network/remote/dio_helper.dart';
import 'states.dart';

class PetologyCubit extends Cubit<PetologyStates> {
  PetologyCubit() : super(InitialState());
  static PetologyCubit get(context) => BlocProvider.of(context);

  List<Widget> screens=[
    AboutUsPage(),
  ];
  void changeScreens(Widget page) {
    screens=[];
    screens.add(page);
    emit(ChangeScreenState());
  }

  bool selected1=false;
  bool selected2=false;
  //in appBar
  void changeSelectedButtonColor({
    bool? select1,
    bool? select2,
  }){
    selected1 = select1!;
    selected2 = select2!;
    emit(ChangeSelecteButtonColorState());
  }

 FirstSectionModel first = FirstSectionModel();
  void getFirstSection(){
    emit(GetFirstSectionLoadingState());
    DioHelper.getData(
        url: FIRESTSECTION,
        ).then((value) {
      first=FirstSectionModel.fromJson(value.data);
      emit(GetFirstSectionLSuccessState());
    }).catchError((error){
      emit(GetFirstSectionErrorState());
      print(error.toString());
    });
  }

  FirstSectionModel second = FirstSectionModel();
  void getSecondSection(){
    emit(GetSecondSectionLoadingState());
    DioHelper.getData(
      url: SECONDSECTION,
    ).then((value) {
      second=FirstSectionModel.fromJson(value.data);
      emit(GetSecondSectionLSuccessState());
    }).catchError((error){
      emit(GetSecondSectionErrorState());
      print(error.toString());
    });
  }

  NeedsModel model=NeedsModel();
  void getNeedsSection(){
    emit(GetNeedsSectionLoadingState());
    DioHelper.getData(
      url: NEED,
    ).then((value) {
      model=NeedsModel.fromJson(value.data);
      emit(GetNeedsSectionLSuccessState());
    }).catchError((error){
      emit(GetNeedsSectionErrorState());
      print(error.toString());
    });
  }

  InformationModel info=InformationModel();
  void getInformation(){
    emit(GetInformationLoadingState());
    DioHelper.getData(
      url: INFORMATIONS,
    ).then((value) {
      info=InformationModel.fromJson(value.data);
      emit(GetInformationLSuccessState());
    }).catchError((error){
      emit(GetInformationErrorState());
      print(error.toString());
    });
  }

  bool dogCard=false;
  bool catCard=false;
  void changeSelectedCardColor({
    required bool dog,
    required bool cat,
  }){
    dogCard = dog;
    catCard = cat;
    emit(ChangeSelectedCardColorState());
  }
}