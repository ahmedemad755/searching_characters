// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:test/data/models/characters_json.dart';
import 'package:test/data/repo/characters_repo.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo charactersRepository;
  List<Results> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  void getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
  }

  // void getQuotes(String charName) {
  //   charactersRepository.getCharacterQuotes(charName).then((quotes) {
  //     emit(QuotesLoaded(quotes));
  //   });
  // }
}
