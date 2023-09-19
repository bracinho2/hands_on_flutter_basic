import 'dart:developer';

import 'package:hands_on_flutter_basic/modules/jokes/data/mappers/joke_category_entity_mapper.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/entities/joke_entity.dart';

class JokeEntityMapper {
  static JokeEntity fromMap({required Map<String, dynamic> map}) {
    try {
      return JokeEntity(
        uid: map['uid'],
        name: map['name'],
        details: map['details'],
        avatar: map['avatar'],
      );
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      rethrow;
    }
  }
}
