import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petology/modules/register/register_cubit/cubit.dart';
import 'package:petology/modules/register/register_cubit/states.dart';
import 'dart:html' as html;

import '../../shared/componentes/componentes.dart';
import '../../shared/componentes/cubit/cubit.dart';
import '../../shared/network/local/cash_helper.dart';
import '../about_us.dart';
import '../login/login.dart';

class RegisterPage extends StatelessWidget{
  var firstNameController=TextEditingController();
  var lastNameController=TextEditingController();
  var emailController=TextEditingController();
  var passwordController= TextEditingController();
  var rePasswordController=TextEditingController();
  var formKey = GlobalKey<FormState>();

  List<String> country=['Italy','Egypt','Japan','Mexico','Russia','Turkey',];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
          builder: (BuildContext context, state)=>Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image(
                      color: HexColor('#FFE3C5'),
                      image: const AssetImage(
                        'assets/images/material-pets.png',
                      ),
                      height: 360.0,
                      width: 420.0,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image(
                      color: HexColor('#FFE3C5'),
                      image: const AssetImage(
                        'assets/images/material-pets.png',
                      ),
                      height: 360.0,
                      width: 420.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(300.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(88.0),
                        border: Border.all(
                            width: 3,
                            color: Colors.black
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(80.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              const Text(
                                'Sign up',
                                style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 54,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                ),
                              ),
                              const SizedBox(height: 95.0,),
                              Row(
                                children: [
                                  Expanded(
                                    child: Material(
                                      elevation: 6.0,
                                      shadowColor: Colors.black,
                                      borderRadius: BorderRadius.circular(54.0),
                                      color: HexColor('#2F4582'),
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: Container(
                                        height: 80.0,
                                        width: double.infinity,
                                        child: MaterialButton(
                                          onPressed: (){
                                            html.window.open('https://petology.orangedigitalcenteregypt.com/auth/oauth2/facebook','_blank');
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children:[
                                              const Image(
                                                image:AssetImage('assets/images/logo-facebook.png'),
                                                height: 30.0,
                                                width: 30.0,
                                              ),
                                              const SizedBox(width: 25.0,),
                                              Text(
                                                'Facebook',
                                                style: TextStyle(
                                                  color: HexColor('#FFFFFF'),
                                                  fontFamily: 'Arial',
                                                  fontSize: 30.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 90.0,),
                                  Expanded(
                                    child: Material(
                                      borderOnForeground: true,
                                      borderRadius: BorderRadius.circular(44.0),
                                      color: Colors.white,
                                      child: Container(
                                        height: 80.0,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(44.0),
                                          border: Border.all(
                                            width: 1.0,
                                          ),
                                        ),
                                        child: MaterialButton(
                                          onPressed: (){
                                            html.window.open('https://petology.orangedigitalcenteregypt.com/auth/oauth2/google', '_blank');
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children:const [
                                              Image(
                                                image:AssetImage('assets/images/logo-google.png'),
                                                height: 30.0,
                                                width: 30.0,
                                              ),
                                              SizedBox(width: 25.0,),
                                              Text(
                                                'Google',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Arial',
                                                  fontSize: 30.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20.0,),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 3.0,
                                      color: HexColor('#180701'),
                                    ),
                                  ),
                                  const SizedBox(width: 10.0,),
                                  Text(
                                    'Or',
                                    style: TextStyle(
                                      color: HexColor('#492F24'),
                                      fontFamily: "Arial",
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,

                                    ),
                                  ),
                                  const SizedBox(width: 10.0,),
                                  Expanded(
                                    child: Container(
                                      height: 3.0,
                                      color: HexColor('#180701'),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 50.0,),
                              textFormField(
                                  controller: firstNameController,
                                  kType: TextInputType.name,
                                  validator: (value){
                                    if(value!.isEmpty)
                                    {
                                      return 'please, enter your first name';
                                    }else
                                    {
                                      return null;
                                    }
                                  },
                                  label: 'First Name'
                              ),
                              const SizedBox(height: 40.0,),
                              textFormField(
                                  controller: lastNameController,
                                  kType: TextInputType.name,
                                  validator: (value){
                                    if(value!.isEmpty)
                                    {
                                      return 'please, enter your last name';
                                    }else
                                    {
                                      return null;
                                    }
                                  },
                                  label: 'Last Name'
                              ),
                              const SizedBox(height: 40.0,),
                              textFormField(
                                  controller: emailController,
                                  kType: TextInputType.emailAddress,
                                  validator: (value){
                                    if(value!.isEmpty)
                                    {
                                      return 'please, enter your email';
                                    }else
                                    {
                                      return null;
                                    }
                                  },
                                  label: 'Email'
                              ),
                              const SizedBox(height: 40.0,),
                              textFormField(
                                  controller: passwordController,
                                  kType: TextInputType.visiblePassword,
                                  obscure: true,
                                  validator: (value){
                                    if(value!.isEmpty)
                                    {
                                      return 'please, enter your password';
                                    }else
                                    {
                                      return null;
                                    }
                                  },
                                  label: 'Password'
                              ),
                              const SizedBox(height: 40.0,),
                              textFormField(
                                  controller:rePasswordController,
                                  kType: TextInputType.visiblePassword,
                                  obscure: true,
                                  validator: (value){
                                    if(value!.isEmpty || passwordController.text != rePasswordController.text)
                                    {
                                      return 'please, re-enter your password';
                                    }else
                                    {
                                      return null;
                                    }
                                  },
                                  label: 'Re-Enter Password'
                              ),
                              const SizedBox(height: 40.0,),
                              dropButton(
                                  items: country,
                                  itemSelected: RegisterCubit.get(context).selectedItem,
                                  hint: 'Country',
                                  change: (value){
                                    RegisterCubit.get(context).selectedCountry(value);
                                  }
                              ),
                              const SizedBox(height: 65.0,),
                              button(
                                  text: 'Sign up',
                                  buttonColor: '#492F24',
                                  textColor: '#FFE3C5',
                                  onPressed: (){
                                    if(formKey.currentState!.validate()){
                                      if(passwordController.text == rePasswordController.text){
                                        RegisterCubit.get(context).userRegister(
                                          firstName: firstNameController.text,
                                          lastName: lastNameController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                          country: '${RegisterCubit.get(context).selectedItem}',
                                        );
                                      }
                                    }
                                  }
                              ),
                              const SizedBox(height: 25.0,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Already have an account?',
                                    style: TextStyle(
                                      fontSize: 24.0,
                                      color: Colors.blueGrey,
                                      fontFamily: "Arial",
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: (){
                                      PetologyCubit.get(context).changeSelectedButtonColor(select1:false,select2:true);
                                      PetologyCubit.get(context).changeScreens(LoginPage());
                                    },
                                    child: const Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(280.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Image(
                        color: HexColor('#593C30'),
                        image: const AssetImage(
                          'assets/images/small2.png',
                        ),
                        height: 100.0,
                        width: 100.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(280.0),
                    child: Container(
                      height: 750.0,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Image(
                          color: HexColor('#593C30'),
                          image: const AssetImage(
                            'assets/images/small.png',
                          ),
                          height: 100.0,
                          width: 100.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]
          ) ,
          listener: (BuildContext context, Object? state) {
            if(state is RegisterSuccessState)
            {
              CashHelper.putData(key: 'token', value: state.user.token).then((value) {
                token=state.user.token;
                PetologyCubit.get(context).changeScreens(AboutUsPage());
                PetologyCubit.get(context).changeSelectedButtonColor(select1:false,select2: false);
              }
              );
            }
          }
      ),
    );
  }
}