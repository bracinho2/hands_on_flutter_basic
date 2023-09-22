import 'package:hands_on_flutter_basic/modules/beer/core/typedef/typedef.dart';
import 'package:hands_on_flutter_basic/modules/beer/domain/entities/beer_entity.dart';

abstract class BeerRepository {
  Future<CreateBeerResult> createBeer({
    required BeerEntity beer,
  });
  Future<ReadBeerResult> readBeer();
  Future<UpdateBeerResult> updateBeer({
    required BeerEntity beer,
  });
  Future<DeleteBeerResult> deleteBeer({
    required String uid,
  });
}
