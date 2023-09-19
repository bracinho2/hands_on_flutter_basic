import 'package:hands_on_flutter_basic/modules/jokes/domain/entities/joke_category_entity.dart';

import '../../domain/entities/joke_entity.dart';

abstract class JokeDatasource {
  Future<bool> createJoke({
    required JokeEntity joke,
  });
  Future<List<JokeEntity>> readJokes();
  Future<bool> updateJoke({
    required JokeEntity joke,
  });
  Future<bool> removeJoke({
    required String uid,
  });
  Future<List<JokeCategoryEntity>> getJokeCategories();
}
