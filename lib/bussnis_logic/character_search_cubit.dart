// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/bussnis_logic/character_search_state.dart';
import 'package:test/data/models/characters_json.dart';

class CharacterSearchCubit extends Cubit<CharacterSearchState> {
  final List<Results> allCharacters;

  CharacterSearchCubit(this.allCharacters)
    : super(
        CharacterSearchState(characters: allCharacters, isSearching: false),
      );

  void startSearch() {
    emit(state.copyWith(isSearching: true));
  }

  void stopSearch() {
    emit(state.copyWith(isSearching: false, characters: allCharacters));
  }

  void search(String query) {
    final filtered =
        allCharacters
            .where(
              (char) =>
                  char.name!.toLowerCase().startsWith(query.toLowerCase()),
            )
            .toList();
    emit(state.copyWith(characters: filtered));
  }

  void clearSearch() {
    emit(state.copyWith(characters: allCharacters));
  }
}
