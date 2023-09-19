import 'package:hands_on_flutter_basic/modules/jokes/domain/entities/joke_entity.dart';
import 'package:hands_on_flutter_basic/modules/jokes/core/typedef/typedef.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/repository/joke_repository.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/usecase/create_joke_usecase.dart';

class CreateJoke implements CreateJokeUsecase {
  final JokeRepository _repository;

  CreateJoke(this._repository);
  @override
  Future<CreateJokeResult> call({required JokeEntity joke}) async {
    return await _repository.createJock(joke: joke);
  }
}
