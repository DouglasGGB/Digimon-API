part of 'digimon_bloc.dart';

@immutable
abstract class DigimonState {}

class DigimonInitial extends DigimonState {}
class DigimonLoadingState extends DigimonState{}
class DigimonErrorState extends DigimonState{
  final String mesagge;
  DigimonErrorState(this.mesagge);
}
class DigimonListSetState extends DigimonState{
 final  List<DigimonModel> listDigimon;
  DigimonListSetState(this.listDigimon);
}
class DigimonSearchState extends DigimonState{
  final DigimonModel digimonSearched;
  DigimonSearchState(this.digimonSearched);
}