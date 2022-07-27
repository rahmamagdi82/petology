import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petology/modules/pet_information.dart';
import 'package:petology/shared/componentes/cubit/cubit.dart';
import 'package:petology/shared/componentes/cubit/states.dart';

import '../models/needs_model.dart';
import '../models/pets_model.dart';
import '../shared/componentes/componentes.dart';
import '../shared/styles/styles.dart';

class AboutUsPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<PetologyCubit, PetologyStates>(
      listener: (context, states) {},
      builder: (context, state) {
        var firstModel = PetologyCubit.get(context).first;
        var secondModel = PetologyCubit.get(context).second;
        var needModel = PetologyCubit.get(context).model;
        var pets = PetologyCubit.get(context).pets;

        return ConditionalBuilder(
          condition: PetologyCubit.get(context).first.title != null &&
              PetologyCubit.get(context).second.title != null &&
              PetologyCubit.get(context).pets.date.length >0,
          builder: (BuildContext context) {
            return Column(
              children: [
                Container(
                  color: HexColor('#674739'),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(100.0),
                          child: Column(
                            children: [
                              Text(
                                '${firstModel.title}',
                                style: titleStyle.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 60.0,
                              ),
                              Text(
                                '${firstModel.body}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Arial',
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  height: 1.3,
                                ),
                              ),
                              const SizedBox(
                                height: 60.0,
                              ),
                              Material(
                                borderOnForeground: true,
                                borderRadius: BorderRadius.circular(44.0),
                                color: Colors.white,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: MaterialButton(
                                  height: 80.0,
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Help them',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Arial',
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
                Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      const Expanded(
                        child: Image(
                          image: AssetImage(
                            'assets/images/tamas-pap-kA967nN0jAA-unsplash-removebg-preview.png',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(100.0),
                          child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              Image(
                                color: HexColor('#FFE3C5'),
                                image: const AssetImage(
                                  'assets/images/material-pets.png',
                                ),
                                height: 360.0,
                                width: 420.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${secondModel.title}',
                                      style: titleStyle),
                                  SizedBox(
                                    height: 60.0,
                                  ),
                                  Text(
                                    '${secondModel.body}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Arial',
                                      fontSize: 20.0,
                                      color: HexColor('#585858'),
                                      height: 1.3,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 160.0),
                  child: Column(
                    children: [
                      Stack(alignment: AlignmentDirectional.topEnd, children: [
                        Image(
                          color: HexColor('#FFE3C5'),
                          image: const AssetImage(
                            'assets/images/small2.png',
                          ),
                          height: 100.0,
                          width: 100.0,
                        ),
                        Text('Lets get this right ....',
                            style: titleStyle.copyWith(
                              fontSize: 74.0,
                              color: HexColor('#492F24'),
                            )),
                      ]),
                      const SizedBox(
                        height: 90.0,
                      ),
                      Text(
                        'What kind of friend you looking for?',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial',
                          fontSize: 66.0,
                          color: HexColor('#492F24'),
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(
                        height: 130.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          categoryCard(
                              nameSelected: PetologyCubit.get(context).dogCard,
                              image: 'assets/images/dog.png',
                              hover: (value) {
                                PetologyCubit.get(context)
                                    .changeSelectedCardColor(
                                        dog: value, cat: false);
                              },
                              onTap: () {}),
                          const SizedBox(
                            width: 115.0,
                          ),
                          categoryCard(
                              nameSelected: PetologyCubit.get(context).catCard,
                              image: 'assets/images/cat.png',
                              hover: (value) {
                                PetologyCubit.get(context)
                                    .changeSelectedCardColor(
                                        dog: false, cat: value);
                              },
                              onTap: () {}),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 180.0),
                    child: Column(
                      children: [
                        Container(
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Image(
                                color: HexColor('#FFE3C5'),
                                image: const AssetImage(
                                  'assets/images/small2.png',
                                ),
                                height: 100.0,
                                width: 100.0,
                              ),
                              Text('Our friends who looking for a house',
                                  style: titleStyle),
                            ],
                          ),
                          width: 600.0,
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              backgroundColor: HexColor('#492F24'),
                              onPressed: () {},
                              child: const Icon(
                                Icons.arrow_back_ios,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 840.0,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return cardItem(pets.date[index],index,context);
                                      },
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                        width: 80,
                                      ),
                                      itemCount: 6,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            FloatingActionButton(
                              backgroundColor: HexColor('#492F24'),
                              onPressed: () {},
                              child: const Icon(
                                Icons.arrow_forward_ios,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 80.0,
                        ),
                        Container(
                          width: 480.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(44.0),
                            color: HexColor('#492F24'),
                          ),
                          child: MaterialButton(
                            height: 80.0,
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Show more',
                                  style: TextStyle(
                                    color: HexColor('#FFE3C5'),
                                    fontFamily: 'Arial',
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: HexColor('#FFE3C5'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: 600.0,
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Image(
                            color: HexColor('#FFE3C5'),
                            image: const AssetImage(
                              'assets/images/small2.png',
                            ),
                            height: 100.0,
                            width: 100.0,
                          ),
                          Text('How to take care of your friends? ',
                              style: titleStyle),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(140.0),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 4,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        childAspectRatio: 1.0 / 1.5,
                        children: List.generate(
                          needModel.date.length,
                          (index) {
                            return item(needModel.date[index]);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
          fallback: (BuildContext context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget cardItem(Pet model,int index,context) => InkWell(
    onTap: (){},
    onHover: (value){
        PetologyCubit.get(context).changeSelectedPet(value: value, index: index);
    },
    child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: PetologyCubit.get(context).petsShadow[index]? 100.0 : 0.0,
          borderOnForeground: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(78.0),
            side: BorderSide(
              width: 4.0,
              color: HexColor('#492F24'),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80.0),
            child: Column(
              children: [
                Image(
                  height: 380.0,
                  width: 380.0,
                  image: NetworkImage(
                    '${model.images[0]}',
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Text(
                  '${model.name}',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0,
                    color: HexColor('#492F24'),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(55.0),
                    side: BorderSide(
                      width: 8.0,
                      color: HexColor('#FFE3C5'),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: MaterialButton(
                    height: 80.0,
                    minWidth: 300.0,
                    onPressed: () {
                      PetologyCubit.get(context).changeScreens(PetInformationPage(model: model));

                    },
                    child: const Text(
                      'Read more',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Arial',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget item(Data model) => InkWell(
        onTap: () {},
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              height: 400.0,
              child: CircleAvatar(
                radius: 140.0,
                backgroundColor: HexColor('#492F24'),
              ),
            ),
            Column(
              children: [
                Image(
                  image: NetworkImage(
                    '${model.imageUrl}',
                  ),
                  height: 180.0,
                  width: 140.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${model.title}',
                  style: TextStyle(
                    fontSize: 39.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Arial',
                    color: HexColor('#FFE3C5'),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
