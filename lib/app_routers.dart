// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/bussnis_logic/characters_cubit.dart';
import 'package:test/constants/strings.dart';
import 'package:test/data/models/characters_json.dart';
import 'package:test/data/repo/characters_repo.dart';
import 'package:test/data/web/characters_web_servies.dart';
import 'package:test/presentation/screans/characters.dart';
import 'package:test/presentation/screans/characters_detailes.dart';

class AppRouter {
  late CharactersRepo charactersRepo;
  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepo = CharactersRepo(
      charactersWebServies: CharactersWebServies(),
    );
    charactersCubit = CharactersCubit(charactersRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (BuildContext context) => charactersCubit,
                child: characters(),
              ),
        );

      case characterDetailsScreen:
        final charcter = settings.arguments as Results;
        return MaterialPageRoute(
          builder: (_) => CharactersDetails(charcter: charcter),
        );
    }
    return null;
  }
}
