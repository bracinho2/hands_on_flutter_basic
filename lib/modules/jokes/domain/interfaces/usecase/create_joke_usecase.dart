import 'package:hands_on_flutter_basic/modules/jokes/core/typedef/typedef.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/entities/joke_entity.dart';

abstract class CreateJokeUsecase {
  Future<CreateJokeResult> call({required JokeEntity joke});
}
