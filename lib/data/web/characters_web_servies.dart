// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:test/constants/strings.dart';
import 'package:test/data/models/characters_json.dart';

class CharactersWebServies {
  late Dio dio;
  CharactersWebServies() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
      receiveDataWhenStatusError: true,
    );
    dio = Dio(baseOptions);
  }
  Future<List<Results>> getAllCharacters() async {
    try {
      Response response = await dio.get('character');
      print(response.data.toString());

      final charactersJson = CharactersJson.fromJson(response.data);
      return charactersJson.results ?? [];
    } catch (e) {
      print('Error while getting characters: $e');
      return [];
    }
  }
}
