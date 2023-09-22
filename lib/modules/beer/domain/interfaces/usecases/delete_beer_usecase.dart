import 'package:hands_on_flutter_basic/modules/beer/core/typedef/typedef.dart';

abstract class DeleteBeerUsecase {
  Future<DeleteBeerResult> call({
    required String uid,
  });
}
