import 'package:hands_on_flutter_basic/modules/jokes/core/typedef/typedef.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/entities/joke_entity.dart';

abstract class JokeRepository {
  Future<CreateJokeResult> createJoke({
    required JokeEntity joke,
  });
  Future<ReadJokesResult> readJokes();
  Future<UpdateJokeResult> updateJoke({
    required JokeEntity joke,
  });
  Future<DeleteJokeResult> removeJoke({
    required String uid,
  });
}
