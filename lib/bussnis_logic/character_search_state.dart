import '../data/models/characters_json.dart';

class CharacterSearchState {
  final List<Results> characters;
  final bool isSearching;

  CharacterSearchState({required this.characters, required this.isSearching});

  CharacterSearchState copyWith({
    List<Results>? characters,
    bool? isSearching,
  }) {
    return CharacterSearchState(
      characters: characters ?? this.characters,
      isSearching: isSearching ?? this.isSearching,
    );
  }
}
