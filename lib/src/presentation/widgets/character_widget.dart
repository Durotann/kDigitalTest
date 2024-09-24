// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:kdigital_test/src/data/models/character.dart';

class CharacterWidget extends StatelessWidget {
  const CharacterWidget({
    Key? key,
    required this.character,
  }) : super(key: key);
  final Character character;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(
                  character.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              Text(character.name),
              Text(character.species),
              Text(character.status),
              Text(character.gender),
            ],
          )
        ],
      ),
    );
  }
}
