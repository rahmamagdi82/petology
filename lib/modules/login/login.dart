import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petology/modules/about_us.dart';
import 'package:petology/modules/login/login_cubit/cubit.dart';
import 'package:petology/shared/componentes/componentes.dart';
import 'dart:html' as html;

import '../../shared/componentes/cubit/cubit.dart';
import '../../shared/network/local/cash_helper.dart';
import '../register/register.dart';
import 'login_cubit/states.dart';


class LoginPage extends StatelessWidget{

var emailController=TextEditingController();
var passwordController= TextEditingController();
var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
   return BlocProvider(
     create: (BuildContext context) =>LoginCubit(),
     child: BlocConsumer<LoginCubit,LoginStates>(
       builder: (BuildContext context, state)=>Padding(
         padding: const EdgeInsets.symmetric(vertical: 100.0),
         child: Stack(
           alignment: AlignmentDirectional.topCenter,
           children: [
              Container(
                height: 315.0,
                child: Image(
                 image: AssetImage(
                   'assets/images/login_image.png',
                 ),
                 height: 360.0,
                 width: 420.0,
             ),
              ),
             Padding(
               padding: const EdgeInsets.all(300.0),
               child: Container(
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
                           'Login',
                           style: TextStyle(
                               fontFamily: 'Arial',
                               fontSize: 54,
                               fontWeight: FontWeight.bold,
                               color: Colors.black
                           ),
                         ),
                         const SizedBox(height: 55.0,),
                         textFormField(
                             controller: emailController,
                             kType: TextInputType.emailAddress,
                             validator: (value){
                               if(value!.isEmpty)
                               {
                                 return 'email must be not empty';
                               }else
                               {
                                 return null;
                               }
                             },
                             label: 'Email'
                         ),
                         const SizedBox(height: 35.0,),
                         textFormField(
                             controller: passwordController,
                             kType: TextInputType.visiblePassword,
                             obscure: true,
                             validator: (value){
                               if(value!.isEmpty)
                               {
                                 return 'password must be not empty';
                               }else
                               {
                                 return null;
                               }
                             },
                             label: 'Password'
                         ),
                         const SizedBox(height: 85.0,),
                         button(
                             text: 'Login',
                             buttonColor: '#492F24',
                             textColor: '#FFE3C5',
                             onPressed: (){
                               if(formKey.currentState!.validate()){
                                 LoginCubit.get(context).userLogin(
                                   email: emailController.text,
                                   password: passwordController.text,
                                 );
                               }
                             }
                         ),
                         const SizedBox(height: 30.0,),
                         Align(
                           alignment: Alignment.centerRight,
                           child: TextButton(
                             onPressed: () {  },
                             child: Text(
                               'Forget password?',
                               style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 21.0,
                                 fontFamily: 'Arial',
                                 color: HexColor('#492F24'),
                               ),
                             ),
                           ),
                         ),
                         const SizedBox(height: 65.0,),
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
                         const SizedBox(
                           height: 65.0,
                         ),
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
                         const SizedBox(
                           height: 50.0,
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             const Text(
                               'Didn\'t have an account?',
                               style: TextStyle(
                                 fontSize: 24.0,
                                 color: Colors.blueGrey,
                                 fontFamily: "Arial",
                               ),
                             ),
                             TextButton(
                               onPressed: (){
                                 PetologyCubit.get(context).changeSelectedButtonColor(select1:true,select2: false);
                                 PetologyCubit.get(context).changeScreens(RegisterPage());
                               },
                               child: const Text(
                                 'Sign up',
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
             ),
           ],
         ),
       ) ,
       listener: (BuildContext context, Object? state) {
         if(state is LoginSuccessState)
           {
             CashHelper.putData(key: 'token', value: state.user.token).then((value) {
           token=state.user.token;
           PetologyCubit.get(context).changeScreens(AboutUsPage());
           PetologyCubit.get(context).changeSelectedButtonColor(select1:false,select2: false);
             }
               );
             }
           },
     ),
   );
  }
}