import '../../domain/entities/beer_entity.dart';

abstract class BeerDatasource {
  Future<bool> createBeer({
    required BeerEntity beer,
  });
  Future<List<BeerEntity>> readBeer();
  Future<bool> updateBeer({
    required BeerEntity beer,
  });
  Future<bool> deleteBeer({
    required String uid,
  });
}
