import 'package:hands_on_flutter_basic/modules/jokes/core/typedef/typedef.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/repository/joke_repository.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/usecase/remove_joke_usecase.dart';

class RemoveJoke implements RemoveJokeUsecase {
  final JokeRepository _repository;

  RemoveJoke(this._repository);

  @override
  Future<DeleteJokeResult> call({required String uid}) async {
    return await _repository.removeJoke(uid: uid);
  }
}
