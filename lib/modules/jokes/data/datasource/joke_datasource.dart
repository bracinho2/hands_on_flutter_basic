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
}
