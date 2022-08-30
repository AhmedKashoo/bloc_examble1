import 'package:bloc_examble/Bloc/api_call_bloc.dart';
import 'package:bloc_examble/Data/Repo/Dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/ob.dart';
import 'Login/login_bloc.dart';
import 'Presentation/Login.dart';
import 'Presentation/Ui.dart';
import 'Presentation/bottomNav.dart';
import 'Presentation/catSelect.dart';
import 'Presentation/search.dart';

void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ApiCallBloc()..add(fetchData()),
        ),
        BlocProvider(
          create: (context) =>LoginBloc(),
        ),
      ],
      child: MaterialApp(


        home: catList(),
      ),
    );
  }
}
