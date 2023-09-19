import 'package:hands_on_flutter_basic/modules/jokes/core/typedef/typedef.dart';

abstract class RemoveJokeUsecase {
  Future<RemoveJokeResult> call({required String uid});
}
