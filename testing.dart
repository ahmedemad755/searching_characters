// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:test/presentation/screans/characters_detailes.dart';

// void main() {
//   runApp(MyApp(approuter: AppRouter()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key, required this.approuter});
//   final AppRouter approuter;
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       onGenerateRoute: approuter.generateRoute,
//     );
//   }
// }

// class AppRouter {
//   late CharactersRepo charactersRepo;
//   late CharactersCubit charactersCubit;
//   AppRouter() {
//     charactersRepo = CharactersRepo(
//       charactersWebServies: CharactersWebServies(),
//     );
//     charactersCubit = CharactersCubit(charactersRepo);
//   }

//   Route? generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case charactersScreen:
//         return MaterialPageRoute(
//           builder:
//               (_) => BlocProvider(
//                 create: (BuildContext context) => charactersCubit,
//                 child: characters(),
//               ),
//         );

//       case characterDetailsScreen:
//         return MaterialPageRoute(builder: (_) => CharactersDetails());
//     }
//     return null;
//   }
// }

// // ignore: must_be_immutable
// class CharacterItem extends StatelessWidget {
//   Results character;
//   CharacterItem({Key? key, required this.character}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsetsDirectional.all(8),
//       margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         color: MyColors.myWhite,
//       ),
//       child: GridTile(
//         footer: Container(
//           width: double.infinity,
//           padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//           color: Colors.black54,
//           alignment: Alignment.bottomCenter,
//           child: Text(
//             character.name!,
//             style: TextStyle(
//               height: 1.3,
//               fontSize: 16,
//               color: MyColors.myWhite,
//               fontWeight: FontWeight.bold,
//             ),
//             overflow: TextOverflow.ellipsis,
//             maxLines: 2,
//             textAlign: TextAlign.center,
//           ),
//         ),
//         child: Container(
//           color: MyColors.myGrey,
//           child:
//               character.image!.isNotEmpty
//                   ? FadeInImage.assetNetwork(
//                     width: double.infinity,
//                     height: double.infinity,
//                     placeholder: "images/Animation - 1744540476078.gif",
//                     image: character.image!,
//                     fit: BoxFit.cover,
//                   )
//                   : Image.asset("images/Capture.PNG"),
//         ),
//       ),
//     );
//   }
// }

// // ignore: camel_case_types
// class characters extends StatefulWidget {
//   const characters({super.key});

//   @override
//   State<characters> createState() => _charactersState();
// }

// class _charactersState extends State<characters> {
//   List<Results>? allcharacters;

//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<CharactersCubit>(context).getAllCharacters();
//   }

//   Widget BuildBlocer() {
//     return BlocBuilder<CharactersCubit, CharactersState>(
//       builder: (context, state) {
//         if (state is CharactersLoaded) {
//           allcharacters = state.characters;
//           return buildLoadedList();
//         } else {
//           return showLoadingIndicator();
//         }
//       },
//     );
//   }

//   Widget showLoadingIndicator() {
//     //علامة التحميل
//     return Center(child: CircularProgressIndicator(color: MyColors.myYellow));
//   }

//   Widget buildLoadedList() {
//     return SingleChildScrollView(
//       child: Container(
//         color: const Color.fromARGB(0, 52, 58, 64),
//         child: Column(children: [buildCharactersList()]),
//       ),
//     );
//   }

//   //الليست النهائيه اللي هتظهر بعد م البيانات تحمل
//   Widget buildCharactersList() {
//     if (allcharacters!.isEmpty) {
//       return Center(child: Text("لا توجد بيانات "));
//     } else {
//       return GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 2 / 3,
//           crossAxisSpacing: 1,
//           mainAxisSpacing: 1,
//         ),
//         shrinkWrap: true,
//         physics: const ClampingScrollPhysics(),
//         itemBuilder: (ctx, index) {
//           return CharacterItem(character: allcharacters![index]);
//         },
//         itemCount: allcharacters!.length,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: MyColors.myYellow,
//         title: Text("new DATAAA", style: TextStyle(color: MyColors.myGrey)),
//       ),
//       body: BuildBlocer(),
//     );
//   }
// }

// class CharactersJson {
//   Info? info;
//   List<Results>? results;

//   CharactersJson({this.info, this.results});

//   CharactersJson.fromJson(Map<String, dynamic> json) {
//     info = json['info'] != null ? new Info.fromJson(json['info']) : null;
//     if (json['results'] != null) {
//       results = <Results>[];
//       json['results'].forEach((v) {
//         results!.add(new Results.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.info != null) {
//       data['info'] = this.info!.toJson();
//     }
//     if (this.results != null) {
//       data['results'] = this.results!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Info {
//   int? count;
//   int? pages;
//   String? next;
//   Null prev;

//   Info({this.count, this.pages, this.next, this.prev});

//   Info.fromJson(Map<String, dynamic> json) {
//     count = json['count'];
//     pages = json['pages'];
//     next = json['next'];
//     prev = json['prev'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['count'] = this.count;
//     data['pages'] = this.pages;
//     data['next'] = this.next;
//     data['prev'] = this.prev;
//     return data;
//   }
// }

// class Results {
//   int? id;
//   String? name;
//   String? status;
//   String? species;
//   String? type;
//   String? gender;
//   Origin? origin;
//   Origin? location;
//   String? image;
//   List<String>? episode;
//   String? url;
//   String? created;

//   Results({
//     this.id,
//     this.name,
//     this.status,
//     this.species,
//     this.type,
//     this.gender,
//     this.origin,
//     this.location,
//     this.image,
//     this.episode,
//     this.url,
//     this.created,
//   });

//   Results.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     status = json['status'];
//     species = json['species'];
//     type = json['type'];
//     gender = json['gender'];
//     origin =
//         json['origin'] != null ? new Origin.fromJson(json['origin']) : null;
//     location =
//         json['location'] != null ? new Origin.fromJson(json['location']) : null;
//     image = json['image'];
//     episode = json['episode'].cast<String>();
//     url = json['url'];
//     created = json['created'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['status'] = this.status;
//     data['species'] = this.species;
//     data['type'] = this.type;
//     data['gender'] = this.gender;
//     if (this.origin != null) {
//       data['origin'] = this.origin!.toJson();
//     }
//     if (this.location != null) {
//       data['location'] = this.location!.toJson();
//     }
//     data['image'] = this.image;
//     data['episode'] = this.episode;
//     data['url'] = this.url;
//     data['created'] = this.created;
//     return data;
//   }
// }

// class Origin {
//   String? name;
//   String? url;

//   Origin({this.name, this.url});

//   Origin.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     url = json['url'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['url'] = this.url;
//     return data;
//   }
// }

// class CharactersRepo {
//   final CharactersWebServies charactersWebServies;

//   CharactersRepo({required this.charactersWebServies});

//   Future<List<CharactersJson>> getAllCharacters() async {
//     final characterList = await charactersWebServies.getAllCharacters();
//     return characterList;
//   }
// }

// class CharactersWebServies {
//   late Dio dio;
//   CharactersWebServies() {
//     BaseOptions baseOptions = BaseOptions(
//       baseUrl: baseUrl,
//       connectTimeout: Duration(seconds: 30),
//       receiveTimeout: Duration(seconds: 30),
//       receiveDataWhenStatusError: true,
//     );
//     dio = Dio(baseOptions);
//   }
//   Future<List<CharactersJson>> getAllCharacters() async {
//     try {
//       Response response = await dio.get('character');
//       print(response.data.toString());

//       // استخرج قائمة الـ characters من داخل الـ JSON
//       final resultsList = response.data['results'] as List;

//       // حوّل كل عنصر إلى كائن من نوع Results
//       return resultsList.map((e) => CharactersJson.fromJson(e)).toList();
//     } catch (e) {
//       print('Error while getting characters: $e');
//       return [];
//     }
//   }
// }

// final baseUrl = 'https://rickandmortyapi.com/api/character';
// const charactersScreen = '/';
// const characterDetailsScreen = '/character_details';

// class MyColors {
//   static const Color myYellow = Color(0xffFFC107);
//   static const Color myGrey = Color(0xff343A40);
//   static const Color myWhite = Color(0xffE1E8EB);
// }

// @immutable
// abstract class CharactersState {}

// class CharactersInitial extends CharactersState {}

// class CharactersLoaded extends CharactersState {
//   final List<Results> characters;
//   CharactersLoaded(this.characters);
// }

// // class QuotesLoaded extends CharactersState {
// //   final List<Quote> quotes;

// //   QuotesLoaded(this.quotes);
// // }

// class CharactersCubit extends Cubit<CharactersState> {
//   final CharactersRepo charactersRepository;
//   List<Results> characters = [];

//   CharactersCubit(this.charactersRepository) : super(CharactersInitial());

//   List<Results> getAllCharacters() {
//     charactersRepository.getAllCharacters().then((Results) {
//       emit(CharactersLoaded(characters));
//       this.characters = characters;
//     });

//     return characters;
//   }

//   // void getQuotes(String charName) {
//   //   charactersRepository.getCharacterQuotes(charName).then((quotes) {
//   //     emit(QuotesLoaded(quotes));
//   //   });
//   // }
// }
