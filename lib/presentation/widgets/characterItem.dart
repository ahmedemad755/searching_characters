// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:test/constants/my_colors.dart';
import 'package:test/constants/strings.dart';
import 'package:test/data/models/characters_json.dart';

// ignore: must_be_immutable
class CharacterItem extends StatelessWidget {
  Results character;
  CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsDirectional.all(8),
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: MyColors.myWhite,
      ),
      child: GestureDetector(
        onTap:
            () => Navigator.pushNamed(
              context,
              characterDetailsScreen,
              arguments: character,
            ),
        child: GridTile(
          footer: Hero(
            tag: character.id!,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                character.name!,
                style: TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: MyColors.myWhite,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: Container(
            color: MyColors.myGrey,
            child:
                character.image!.isNotEmpty
                    ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: "images/Animation - 1744540476078.gif",
                      image: character.image!,
                      fit: BoxFit.cover,
                    )
                    : Image.asset("images/Capture.PNG"),
          ),
        ),
      ),
    );
  }
}
