import 'package:hands_on_flutter_basic/modules/jokes/core/typedef/typedef.dart';

abstract class RemoveJokeUsecase {
  Future<DeleteJokeResult> call({required String uid});
}
