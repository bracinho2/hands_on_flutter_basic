import 'package:hands_on_flutter_basic/modules/jokes/core/typedef/typedef.dart';

abstract class GetJokeCategoriesUsecase {
  Future<GetJokesCategoryResult> call();
}
