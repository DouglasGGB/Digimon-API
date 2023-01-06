import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/Bloc/bloc.dart';

Future<void> digimonNotFoundAlert(BuildContext context,String digimonError, String nameOfDigimon ) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  const Center(child: Text("Error")),
          backgroundColor: Colours.crimson,
          content:  Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                (digimonError.contains("is not a Digimon in our database")) ? ("$nameOfDigimon is not a digimon") : digimonError,
                style: const TextStyle(color: Colours.white70)
                ))
            ],
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Ok'),
                onPressed: () {
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


Future<void> digimonSimpleErrorAlert(BuildContext context,String digimonError) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  const Center(child: Text("Error")),
          backgroundColor: Colours.crimson,
          content:  Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text(
                  digimonError,
                  style: const TextStyle(color: Colours.white70)
                  )
                )
            ],
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Ok'),
                onPressed: () {
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