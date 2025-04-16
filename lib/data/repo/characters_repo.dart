import '../models/characters_json.dart';
import '../web/characters_web_servies.dart';

class CharactersRepo {
  final CharactersWebServies charactersWebServies;

  CharactersRepo({required this.charactersWebServies});
  Future<List<Results>> getAllCharacters() async {
    final characterList = await charactersWebServies.getAllCharacters();
    return characterList;
  }
}
