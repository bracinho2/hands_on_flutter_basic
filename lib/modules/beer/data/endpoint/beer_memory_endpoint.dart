import 'package:hands_on_flutter_basic/modules/beer/data/mapper/beer_entity_mapper.dart';
import 'package:hands_on_flutter_basic/modules/beer/domain/entities/beer_entity.dart';

import '../../../../core/mocks/beers.dart';
import '../datasource/beer_datasource.dart';

class BeerMemoryEndpoint implements BeerDatasource {
  final _memoryList =
      beerJson.map((json) => BeerEntityMapper.fromMap(map: json)).toList();

  @override
  Future<bool> createBeer({required BeerEntity beer}) async {
    _memoryList.add(beer);
    _memoryList.sort(((a, b) => a.uid.compareTo(b.uid)));

    return true;
  }

  @override
  Future<List<BeerEntity>> readBeer() async {
    return _memoryList;
  }

  @override
  Future<bool> updateBeer({required BeerEntity beer}) async {
    var data = _memoryList.firstWhere((element) => element.uid == beer.uid);
    _memoryList.remove(data);
    _memoryList.add(beer);
    _memoryList.sort(((a, b) => a.uid.compareTo(b.uid)));
    return true;
  }

  @override
  Future<bool> deleteBeer({required String uid}) async {
    _memoryList.remove(_memoryList.firstWhere((element) => element.uid == uid));
    _memoryList.sort(((a, b) => a.uid.compareTo(b.uid)));
    return true;
  }
}
