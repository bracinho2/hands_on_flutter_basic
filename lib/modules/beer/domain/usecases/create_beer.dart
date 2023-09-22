import 'package:hands_on_flutter_basic/modules/beer/domain/entities/beer_entity.dart';
import 'package:hands_on_flutter_basic/modules/beer/core/typedef/typedef.dart';
import 'package:hands_on_flutter_basic/modules/beer/domain/interfaces/repository/beer_repository.dart';
import 'package:hands_on_flutter_basic/modules/beer/domain/interfaces/usecases/create_beer_usecase.dart';

class CreateBeer implements CreateBeerUsecase {
  final BeerRepository _repository;

  CreateBeer(this._repository);

  @override
  Future<CreateBeerResult> call({required BeerEntity beer}) async {
    final result = await _repository.createBeer(beer: beer);

    return result;
  }
}
