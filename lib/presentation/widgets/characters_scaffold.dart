// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:test/bussnis_logic/character_search_cubit.dart';
// import 'package:test/bussnis_logic/character_search_state.dart';

// class CharactersScaffold extends StatelessWidget {
//   const CharactersScaffold({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Characters')),
//       body: BlocBuilder<CharacterSearchCubit, CharacterSearchState>(
//         builder: (context, state) {
//           final characters = state.characters;

//           return ListView.builder(
//             itemCount: characters.length,
//             itemBuilder: (context, index) {
//               final character = characters[index];
//               return ListTile(title: Text(character.name ?? 'No Name'));
//             },
//           );
//         },
//       ),
//     );
//   }
// }
