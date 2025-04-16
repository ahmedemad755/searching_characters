import 'package:flutter/material.dart';
import '../../bussnis_logic/characters_cubit.dart';
import '../../constants/my_colors.dart';
import '../../data/models/characters_json.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/characterItem.dart';
import 'package:flutter_offline/flutter_offline.dart';
// import 'package:flutter_offline/flutter_offline.dart';

// ignore: camel_case_types
class characters extends StatefulWidget {
  const characters({super.key});

  @override
  State<characters> createState() => _charactersState();
}

class _charactersState extends State<characters> {
  List<Results>? allcharacters;
  late List<Results> searchedForCharacters;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();
  bool _isInit = true;

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: MyColors.myGrey,
      decoration: InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: MyColors.myGrey, fontSize: 18),
      ),
      style: TextStyle(color: MyColors.myGrey, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedFOrItemsToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchedFOrItemsToSearchedList(searchedCharacter) {
    searchedForCharacters =
        allcharacters!
            .where(
              (Results) =>
                  Results.name!.toLowerCase().startsWith(searchedCharacter),
            )
            .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear, color: MyColors.myGrey),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: Icon(Icons.search, color: MyColors.myGrey),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(
      context,
    )!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      BlocProvider.of<CharactersCubit>(context).getAllCharacters();
      _isInit = false;
    }
  }

  Widget BuildBlocer() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allcharacters = state.characters;
          return buildLoadedList();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(child: CircularProgressIndicator(color: MyColors.myYellow));
  }

  Widget buildLoadedList() {
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromARGB(0, 230, 11, 11),
        child: Column(children: [buildCharactersList()]),
      ),
    );
  }

  Widget buildCharactersList() {
    if (allcharacters!.isEmpty) {
      return Center(child: Text("لا توجد بيانات "));
    } else {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (ctx, index) {
          return CharacterItem(
            character:
                _searchTextController.text.isEmpty
                    ? allcharacters![index]
                    : searchedForCharacters[index],
          );
        },
        itemCount:
            _searchTextController.text.isEmpty
                ? allcharacters!.length
                : searchedForCharacters.length,
      );
    }
  }

  Widget _buildAppBarTitle() {
    return Text('Characters', style: TextStyle(color: MyColors.myGrey));
  }

  Widget buildNoInternetWidget() {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Can\'t connect .. check internet',
              style: TextStyle(fontSize: 22, color: MyColors.myGrey),
            ),
            Image.asset('images/undraw_file-search_cbur.png'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        leading:
            _isSearching ? BackButton(color: MyColors.myGrey) : Container(),
        title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
        actions: _buildAppBarActions(),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          List<ConnectivityResult> connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;

          if (connected) {
            return BuildBlocer();
          } else {
            return buildNoInternetWidget();
          }
        },
        child: showLoadingIndicator(),
      ),
    );
  }
}

//##############################################3
// import 'package:flutter/material.dart';
// // ignore: depend_on_referenced_packages
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:test/bussnis_logic/character_search_cubit.dart';
// import 'package:test/bussnis_logic/characters_cubit.dart';
// import 'package:test/constants/my_colors.dart';
// import 'package:test/data/models/characters_json.dart';
// import 'package:test/presentation/widgets/characters_scaffold.dart';

// class Characters extends StatefulWidget {
//   const Characters({super.key});

//   @override
//   State<Characters> createState() => _CharactersScreenState();
// }

// class _CharactersScreenState extends State<Characters> {
//   List<Results>? allCharacters;
//   bool _isInit = true;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     if (_isInit) {
//       BlocProvider.of<CharactersCubit>(context).getAllCharacters();
//       _isInit = false;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CharactersCubit, CharactersState>(
//       builder: (context, state) {
//         if (state is CharactersLoaded) {
//           allCharacters = state.characters;

//           return BlocProvider<CharacterSearchCubit>(
//             create: (_) => CharacterSearchCubit(allCharacters!),
//             child: CharactersScaffold(), // تغليف الشاشة بالـ BlocProvider
//           );
//         } else {
//           return const Center(
//             child: CircularProgressIndicator(color: MyColors.myYellow),
//           );
//         }
//       },
//     );
//   }
// }
