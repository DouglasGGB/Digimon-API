import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/models/digimon.dart';
import 'package:flutter_application_1/domain/repositories/digimonrepository.dart';

part 'digimon_event.dart';
part 'digimon_state.dart';

class DigimonBloc extends Bloc<DigimonEvent, DigimonState> {
  final DigimonRepository digimonRepository;
  DigimonBloc(this.digimonRepository) : super(DigimonInitial()) {
    on<DigimonEvent>((event, emit) {});

    on<SetDigimonListEvent>((event, emit) async {
     emit(DigimonLoadingState());
     try{
      await digimonRepository.getAllDigimon();
      final data =  digimonRepository.digimonList;
      emit(DigimonListSetState(data));
     }
     catch(e){
      emit(DigimonErrorState(e.toString()));
     } 
    });

    on<DigimoninitialStateEvent>((event, emit) => emit(DigimonInitial()));


    on<SearchDigimonEvent>((event, emit) async {
       emit(DigimonLoadingState());
     try{
      await digimonRepository.searchDigimonByName(event.nameOfDigimon);
      final data =  digimonRepository.digimonSearched;
      emit(DigimonSearchState(data ?? data!.copyWith(
            img:   digimonRepository.digimon404.img,
            name:  digimonRepository.digimon404.name,
            level: digimonRepository.digimon404.level
            )
          )
        );
     }
     catch(e){
      emit(DigimonErrorState(e.toString()));
     } 
    });

    on<FilterDigimonLevelEvent>((event, emit) async {
      emit(DigimonLoadingState());
      try{
        await digimonRepository.searchDigimonByLevel(event.digimonLevel);
        final data = digimonRepository.digimonListByLevel;
        emit(DigimonListSetState(data));
      } catch(e){
        emit(DigimonErrorState(e.toString()));
      }     
    });
    
  }
}
