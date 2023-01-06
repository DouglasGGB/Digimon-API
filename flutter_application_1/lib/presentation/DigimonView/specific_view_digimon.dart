  part of 'digimon_view_general.dart';

  Future<void> _specifiDigimon(BuildContext context,DigimonModel digimonSelected) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Center(child: Text(digimonSelected.name)),
          backgroundColor: _colorsByLevel(digimonSelected.level),
          content:  Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image:NetworkImage(digimonSelected.img)),
              const SizedBox(height: 10,),
              Text(digimonSelected.level)
            ],
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Ok'),
                onPressed: ()  {
                  final blocDigimon =BlocProvider.of<DigimonBloc>(context);
                  blocDigimon.add(DigimoninitialStateEvent());
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

