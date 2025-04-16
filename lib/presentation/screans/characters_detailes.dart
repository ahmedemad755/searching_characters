import 'package:flutter/material.dart';
import '../../constants/my_colors.dart';
import '../../data/models/characters_json.dart';

class CharactersDetails extends StatelessWidget {
  final Results charcter;
  const CharactersDetails({super.key, required this.charcter});

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(charcter.name!, style: TextStyle(color: MyColors.myGrey)),
        background: Hero(
          tag: charcter.id!,
          child: Image.network(charcter.image!, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget characterInfo(String? title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(color: MyColors.myWhite, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: MyColors.myYellow,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    characterInfo("name : ", charcter.name!),
                    buildDivider(315),
                    characterInfo("name : ", charcter.name!),
                    buildDivider(315),
                    characterInfo("name : ", charcter.name!),
                    buildDivider(315),
                    characterInfo("name : ", charcter.name!),
                    buildDivider(315),
                    characterInfo("name : ", charcter.name!),
                    buildDivider(315),
                    characterInfo("name : ", charcter.name!),
                    buildDivider(315),
                    SizedBox(height: 250),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
