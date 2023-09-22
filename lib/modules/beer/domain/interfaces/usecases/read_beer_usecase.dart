import 'package:hands_on_flutter_basic/modules/beer/core/typedef/typedef.dart';

abstract class ReadBeerUsecase {
  Future<ReadBeerResult> call();
}
