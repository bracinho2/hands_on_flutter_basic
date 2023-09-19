import 'package:hands_on_flutter_basic/modules/jokes/core/typedef/typedef.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/repository/joke_repository.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/usecase/get_joke_categories_usecase.dart';

class GetJokeCategories implements GetJokeCategoriesUsecase {
  final JokeRepository _repository;

  GetJokeCategories(this._repository);

  @override
  Future<GetJokesCategoryResult> call() async {
    return await _repository.getJokeCategories();
  }
}
