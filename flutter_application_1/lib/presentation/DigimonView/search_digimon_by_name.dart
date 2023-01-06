  part of 'digimon_view_general.dart';

 Future<void> _searchDigimonByName(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        String nameOfDigimon = "";
        TextEditingController digiController = TextEditingController();
        return AlertDialog(
          title:  const Center(child: Text("Type the Digimon's name")),
          backgroundColor: Colours.darkGrey,
          content:  Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: digiController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                ],
                onChanged:(value) => nameOfDigimon = value,
              )
            ],
          ),
          actions: <Widget>[
            Center(
              child: BlocBuilder<DigimonBloc, DigimonState>(
                builder: (context, state) {
                  if(state is DigimonLoadingState){
                    return const Center(child: CircularProgressIndicator());
                  }
                  if(state is DigimonErrorState){
                    Future(() => digimonNotFoundAlert(context,state.mesagge,nameOfDigimon));
                  }
                  if(state is DigimonSearchState){
                    Future(() => _specifiDigimon(context,state.digimonSearched));
                    nameOfDigimon = '';
                  }
                  return TextButton(
                              style: TextButton.styleFrom(
                                textStyle: Theme.of(context).textTheme.labelLarge,
                              ),
                              child: const Text('Search'),
                              onPressed: ()  {
                                if(nameOfDigimon==""){
                                  Future(() => digimonNotFoundAlert(context,"Please Writte a name",nameOfDigimon));
                                  return;
                                }
                                final blocDigimon =BlocProvider.of<DigimonBloc>(context);
                                blocDigimon.add(SearchDigimonEvent(nameOfDigimon));
                                digiController.clear();
                              },
                            );
                },
              ),
            ),
          ],
        );
      },
    );
  }
