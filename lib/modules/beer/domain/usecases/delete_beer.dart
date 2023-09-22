import 'package:hands_on_flutter_basic/modules/beer/core/typedef/typedef.dart';
import 'package:hands_on_flutter_basic/modules/beer/domain/interfaces/repository/beer_repository.dart';
import 'package:hands_on_flutter_basic/modules/beer/domain/interfaces/usecases/delete_beer_usecase.dart';

class DeleteBeer implements DeleteBeerUsecase {
  final BeerRepository _repository;

  DeleteBeer(this._repository);
  @override
  Future<DeleteBeerResult> call({required String uid}) async {
    return await _repository.deleteBeer(uid: uid);
  }
}
