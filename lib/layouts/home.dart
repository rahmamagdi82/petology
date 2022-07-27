import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petology/modules/about_us.dart';
import 'package:petology/modules/request.dart';
import 'package:petology/modules/services.dart';

import '../modules/categories.dart';
import '../modules/login/login.dart';
import '../modules/register/register.dart';
import '../shared/componentes/componentes.dart';
import '../shared/componentes/cubit/cubit.dart';
import '../shared/componentes/cubit/states.dart';
import '../shared/styles/colors.dart';

class HomePage extends StatelessWidget{
  var emailController=TextEditingController();
  var passwordController= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PetologyCubit,PetologyStates>(
      listener: (context,states)=>{},
      builder: (context,states){
        var information=PetologyCubit.get(context).info;
        return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: HexColor('#56392D'),
              title: const Image(
                image: AssetImage(
                  'assets/images/logo-removebg-preview.png',
                ),
              ),
              actions: [
                textButton(
                  onPressed: () {
                    PetologyCubit.get(context).changeScreens(AboutUsPage());
                    PetologyCubit.get(context).changeSelectedButtonColor(select1:false,select2: false);
                    },
                  text: 'About us',
                ),
                const SizedBox(
                  width: 20.0,
                ),
                textButton(onPressed: () {
                  PetologyCubit.get(context).changeScreens(CategoriesPage());
                  PetologyCubit.get(context).changeSelectedButtonColor(select1:false,select2: false);
                  }, text: 'Categories'),
                const SizedBox(
                  width: 20.0,
                ),
                textButton(onPressed: () {
                  PetologyCubit.get(context).changeScreens(ServicesPage());
                  PetologyCubit.get(context).changeSelectedButtonColor(select1:false,select2: false);

                }, text: 'Services'),
                const SizedBox(
                  width: 20.0,
                ),
                textButton(onPressed: () {
                  PetologyCubit.get(context).changeScreens(RequestPage());
                  PetologyCubit.get(context).changeSelectedButtonColor(select1:false,select2: false);

                }, text: 'Request'),
                const SizedBox(
                  width: 30.0,
                ),
                buttonInAppBar(
                  selected: PetologyCubit.get(context).selected1,
                  onPressed: () {
                    PetologyCubit.get(context).changeSelectedButtonColor(select1:true,select2: false);
                    PetologyCubit.get(context).changeScreens(RegisterPage());
                  },
                  text: 'Sign up',
                ),
                const SizedBox(
                  width: 10.0,
                ),
                buttonInAppBar(
                  selected: PetologyCubit.get(context).selected2,
                  onPressed: () {
                    PetologyCubit.get(context).changeSelectedButtonColor(select1:false,select2:true);
                    PetologyCubit.get(context).changeScreens(LoginPage());
                  },
                  text: 'Login',
                ),
              ],
            ),
            body:FooterView(
                footer: Footer(
                  backgroundColor: HexColor('#180701'),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'For any questions',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 54.0,
                                  fontWeight: FontWeight.bold,
                                  color: defaultColor,
                                ),
                              ),
                              fotterItems(icon: Icons.email, text: '${information.email}'),
                              fotterItems(icon: Icons.phone, text: '${information.phone}'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'We are waiting you',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 54.0,
                                  fontWeight: FontWeight.bold,
                                  color: defaultColor,
                                ),
                              ),
                              fotterItems(
                                  icon: Icons.location_on,
                                  text: '${information.location}'),
                              fotterItems(icon: Icons.location_on, text: '${information.location2}'),
                            ],
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Image(
                          image: AssetImage(
                            'assets/images/tamas-pap-kA967nN0jAA-unsplash-removebg-preview.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                children: PetologyCubit.get(context).screens
            )
        );
      }

    );
  }

}