
import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/domain/models.dart';
import 'package:flutter_application_1/presentation/reuse/error_alert.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/Bloc/bloc.dart';

part 'list_view_digimon.dart';
part 'specific_view_digimon.dart';
part 'search_digimon_by_name.dart';
part 'digimon_level_selector.dart';

class DigimonViewGeneral extends StatelessWidget {
  const DigimonViewGeneral({super.key});

  @override
  Widget build(BuildContext context) {
    final blocDigimon = BlocProvider.of<DigimonBloc>(context);
    blocDigimon.add(SetDigimonListEvent());
    return Scaffold(
      appBar: AppBar(title: const Text("DIGIMON"),),
      body: BlocBuilder<DigimonBloc, DigimonState>(
        buildWhen: (previous, current) => previous != current && current is DigimonListSetState,
        builder: (context, state) {
          if(state is DigimonLoadingState){
              return const Center(child: CircularProgressIndicator());
          }
          if(state is DigimonErrorState){
              Future(() => digimonNotFoundAlert(context,state.mesagge,"Error"));
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (state is DigimonListSetState) 
                    Expanded(
                      flex: 8,
                      child: _ListDigimon(listOfDigimon: state.listDigimon,)
                    )
                  else 
                    const Center(child:Text("Ocurrio un error")),
                 
                ]
              ),
          );
        },
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(
          left: 40.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Spacer(),
            FloatingActionButton(
              tooltip: 'Filter',
              onPressed: () {
                _digimonLevelSelector(context);
              },
              backgroundColor: Colors.white.withOpacity(.4),
              child: const Icon(
                Icons.filter_alt,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            FloatingActionButton(
              tooltip: 'Search',
              onPressed: () {
                _searchDigimonByName(context);
              },
              backgroundColor: Colors.white.withOpacity(.4),
              child: const Icon(
                Icons.search_sharp,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            FloatingActionButton(
              tooltip: 'Reset',
              onPressed: () {
                blocDigimon.add(SetDigimonListEvent());
              },
              backgroundColor: Colors.white.withOpacity(.4),
              child: const Icon(
                Icons.restart_alt_sharp,
                color: Colors.black,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}


 _colorsByLevel(String levelOfDigimon){
   Map<String,Color> mapOfColorsBylevel={
    "Fresh"      :Colours.paleVioletRed,
    "In Training":Colours.lightSteelBlue,
    "Training"   :const Color.fromARGB(255, 23, 128, 26),
    "Rookie"     :Colours.darkSeagreen,
    "Champion"   :Colours.plum,
    "Armor"      :Colours.darkMagenta,
    "Ultimate"   :Colours.mediumPurple,
    "Mega"       :Colours.gold,
  };
  return mapOfColorsBylevel[levelOfDigimon] ?? Colors.grey;
}


