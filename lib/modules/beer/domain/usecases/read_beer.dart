import 'package:hands_on_flutter_basic/modules/beer/core/typedef/typedef.dart';
import 'package:hands_on_flutter_basic/modules/beer/domain/interfaces/repository/beer_repository.dart';
import 'package:hands_on_flutter_basic/modules/beer/domain/interfaces/usecases/read_beer_usecase.dart';

class ReadBeer implements ReadBeerUsecase {
  final BeerRepository _repository;

  ReadBeer(this._repository);
  @override
  Future<ReadBeerResult> call() async {
    return await _repository.readBeer();
  }
}
