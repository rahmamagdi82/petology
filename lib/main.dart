import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology/shared/componentes/componentes.dart';
import 'package:petology/shared/componentes/cubit/bloc_observe.dart';
import 'package:petology/shared/componentes/cubit/cubit.dart';
import 'package:petology/shared/componentes/cubit/states.dart';
import 'package:petology/shared/network/local/cash_helper.dart';
import 'package:petology/shared/network/remote/dio_helper.dart';

import 'layouts/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.initial();
  await CashHelper.initial();
  token=CashHelper.getData(key: 'token');
  BlocOverrides.runZoned(
        () {
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)  => PetologyCubit()..getFirstSection()..getSecondSection()..getNeedsSection()..getInformation()..getPets(),
      child: BlocConsumer<PetologyCubit,PetologyStates>(
        builder: (BuildContext context, state) =>MaterialApp(
          home:  HomePage(),
          debugShowCheckedModeBanner: false,
        ),
        listener: (BuildContext context, Object? state) {  },
      ),
    );
  }
}