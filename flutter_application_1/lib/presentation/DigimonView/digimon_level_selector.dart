part of 'digimon_view_general.dart';

Future<void> _digimonLevelSelector(BuildContext context) {
    final blocDigimon = BlocProvider.of<DigimonBloc>(context);
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  const Center(child: Text("Select the level of the digimon")),
          backgroundColor: Colours.darkGrey,
          content:  BlocBuilder<DigimonBloc, DigimonState>(
            builder: (context, state) {
              if(state is DigimonLoadingState){
                return const Center(child: CircularProgressIndicator());
              }
              if(state is DigimonErrorState){
                Future(() => digimonNotFoundAlert(context,state.mesagge,"Error"));
              }
              return Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8.0, // gap between adjacent chips
                      runSpacing: 4.0, // gap between lines
                      children: [
                        const Divider(),
                        ...levels.map((e) => TextButton(
                          onPressed: (){
                            blocDigimon.add(FilterDigimonLevelEvent(e));
                            Navigator.pop(context);
                          }, 
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(_colorsByLevel(e))
                          ),
                          child: Text(
                            style: const TextStyle(
                              color: Colours.white
                            ),
                            e
                            ))).toList()
                      ],
                    );
            },
          ),
        );
      },
    );
  }

  List<String> levels = <String>[
    "Fresh",
    "In Training",
    "Training",
    "Rookie",
    "Armor", 
    "Champion",
    "Ultimate",
    "Mega",
  ];