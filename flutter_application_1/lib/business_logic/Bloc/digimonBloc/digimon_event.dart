part of 'digimon_bloc.dart';

@immutable
abstract class DigimonEvent {}

class SetDigimonListEvent extends DigimonEvent{}
class SearchDigimonEvent extends DigimonEvent{
  final String nameOfDigimon;
  SearchDigimonEvent(this.nameOfDigimon);
}
class FilterDigimonLevelEvent extends DigimonEvent{
  final String digimonLevel;
  FilterDigimonLevelEvent(this.digimonLevel);
}
class DigimoninitialStateEvent extends DigimonEvent{}
