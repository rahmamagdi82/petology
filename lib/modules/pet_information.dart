import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petology/shared/componentes/cubit/cubit.dart';
import 'package:petology/shared/componentes/cubit/states.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/pets_model.dart';
import '../shared/styles/styles.dart';

class PetInformationPage extends StatelessWidget{
  late Pet model;
  var pageController=PageController();

  PetInformationPage({required this.model});

  @override
  Widget build(BuildContext context) {
    print(model.name);
    return BlocConsumer<PetologyCubit,PetologyStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: HexColor('#674739'),
              height: 900.0,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          FloatingActionButton(
                            onPressed: (){
                              pageController.previousPage(
                                duration: const Duration(milliseconds: 750),
                                curve: Curves.fastLinearToSlowEaseIn,
                              );
                              },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: HexColor('#674739'),
                            ),
                            backgroundColor: HexColor('#FFE3C5'),
                          ),
                          Expanded(
                            child: PageView.builder(
                              itemBuilder: (context,index){
                                return Image(
                                  height: 900.0,
                                    width: 500.0,
                                    image: NetworkImage('${model.images[index]}'));
                              },
                              itemCount: model.images.length,
                              physics: const BouncingScrollPhysics(),
                              controller: pageController,
                            ),
                          ),
                          FloatingActionButton(
                            onPressed: (){
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 750),
                                curve: Curves.fastLinearToSlowEaseIn,
                              );

                            },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: HexColor('#674739'),
                            ),
                            backgroundColor: HexColor('#FFE3C5'),
                          ),
                        ],
                      ),
                    ),
                    SmoothPageIndicator(
                      count: 3,
                      controller: pageController,
                      effect:  ExpandingDotsEffect(
                          dotWidth: 10.0,
                          dotHeight: 10.0,
                          dotColor: Colors.grey,
                          activeDotColor: HexColor('#FFE3C5'),
                          expansionFactor: 2,
                          spacing: 5
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text(
                  '${model.name}',
                style: titleStyle.copyWith(
                  fontSize: 81.0,
                  color: HexColor('#492F24'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Row(
                children: [
                  Text(
                    'Shared by:',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w400,
                      color: HexColor('#492F24'),
                    ),
                  ),
                  Text(
                    '${model.user!['fName']} ${model.user!['lName']}',
                    style: TextStyle(
                      fontSize: 65.0,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#492F24'),
                      decoration: TextDecoration.underline
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(
                        Icons.whatsapp,
                      size: 30.0,
                    ),
                    color: HexColor('#492F24'),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(
                        Icons.phone,
                      size: 30.0,
                    ),
                    color: HexColor('#492F24'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text(
                '${model.description}',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.w400,
                  color: HexColor('#492F24'),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

}