import 'package:hands_on_flutter_basic/modules/jokes/domain/entities/joke_entity.dart';
import 'package:hands_on_flutter_basic/modules/jokes/core/typedef/typedef.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/repository/joke_repository.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/usecase/update_joke_usecase.dart';

class UpdateJoke implements UpdateJokeUsecase {
  final JokeRepository _repository;

  UpdateJoke(this._repository);
  @override
  Future<UpdateJokeResult> call({required JokeEntity joke}) async {
    return await _repository.updateJoke(joke: joke);
  }
}
