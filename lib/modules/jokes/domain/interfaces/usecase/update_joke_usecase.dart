import 'package:hands_on_flutter_basic/modules/jokes/core/typedef/typedef.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/entities/joke_entity.dart';

abstract class UpdateJokeUsecase {
  Future<UpdateJokeResult> call({
    required JokeEntity joke,
  });
}
