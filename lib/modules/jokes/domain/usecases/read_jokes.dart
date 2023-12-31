import 'package:hands_on_flutter_basic/modules/jokes/core/typedef/typedef.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/repository/joke_repository.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/usecase/read_jokes_usecase.dart';

class ReadJokes implements ReadJokesUsecase {
  final JokeRepository _repository;

  ReadJokes(this._repository);
  @override
  Future<ReadJokesResult> call() async {
    return await _repository.readJokes();
  }
}
