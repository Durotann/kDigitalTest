import 'package:flutter/material.dart';
import 'package:kdigital_test/src/data/repository/characters_repository.dart';
import 'package:kdigital_test/src/enums/enum.dart';
import 'package:kdigital_test/src/presentation/bloc/main_event.dart';
import 'package:kdigital_test/src/presentation/bloc/main_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final CharactersRepository charactersRepository;

  MainPageBloc({required this.charactersRepository})
      : super(MainPageState.initial()) {
    on<CharacterListLoad>(characterListLoad);
  }

  void characterListLoad(CharacterListLoad event, Emitter emit) async {
    emit(state.copyWith(logicStatus: LogicStatus.loading));
    try {
      final result = await charactersRepository.getCharacters(event.page);
      emit(
        state.copyWith(
          logicStatus: LogicStatus.success,
          characters: result,
        ),
      );
    } catch (e, stackTrace) {
      debugPrint("$e");
      debugPrint("$stackTrace");
      emit(
        state.copyWith(
          logicStatus: LogicStatus.error,
        ),
      );
    }
  }
}
