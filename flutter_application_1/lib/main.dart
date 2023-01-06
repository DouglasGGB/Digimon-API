import 'package:flutter/material.dart';
import 'package:flutter_application_1/business_logic/Bloc/digimonBloc/digimon_bloc.dart';
import 'package:flutter_application_1/domain/repositories/digimonrepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<DigimonRepository>(create: (context)=>DigimonRepository())
      ],
      child: MultiBlocProvider(
        providers:[
          BlocProvider(create: (context)=> DigimonBloc(RepositoryProvider.of<DigimonRepository>(context)))
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.dark(useMaterial3: true),
          home: const DigimonViewGeneral(),
        ),
      ),
    );
  }
}

