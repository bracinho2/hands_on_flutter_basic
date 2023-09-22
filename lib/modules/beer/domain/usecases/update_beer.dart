import 'package:hands_on_flutter_basic/modules/beer/domain/entities/beer_entity.dart';
import 'package:hands_on_flutter_basic/modules/beer/core/typedef/typedef.dart';
import 'package:hands_on_flutter_basic/modules/beer/domain/interfaces/repository/beer_repository.dart';
import 'package:hands_on_flutter_basic/modules/beer/domain/interfaces/usecases/update_beer_usecase.dart';

class UpdateBeer implements UpdateBeerUsecase {
  final BeerRepository _repository;

  UpdateBeer(this._repository);
  @override
  Future<UpdateBeerResult> call({required BeerEntity beer}) async {
    return await _repository.updateBeer(beer: beer);
  }
}
