import 'package:hands_on_flutter_basic/core/services/api_client/my_api_client.dart';
import 'package:hands_on_flutter_basic/modules/jokes/data/datasource/joke_datasource.dart';
import 'package:hands_on_flutter_basic/modules/jokes/data/mappers/joke_category_entity_mapper.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/entities/joke_category_entity.dart';

import 'package:hands_on_flutter_basic/modules/jokes/domain/entities/joke_entity.dart';

import '../mappers/joke_entity_mapper.dart';

class JokeDatasourceImpl implements JokeDatasource {
  final MyApiClient _myApiClient;

  JokeDatasourceImpl(this._myApiClient);

  @override
  Future<JokeEntity> getJokes() async {
    final response = await _myApiClient.get(path: '/random');

    final values = JokeEntityMapper.fromMap(map: response.data);

    return values;
  }

  @override
  Future<List<JokeCategoryEntity>> getJokeCategories() async {
    final response = await _myApiClient.get(path: '/categories');
    final values = (response.data as List)
        .map((c) => JokeCategoryEntityMapper.fromMap(value: c))
        .toList();
    return values;
  }

  @override
  Future<bool> createJoke({required JokeEntity joke}) {
    throw UnimplementedError();
  }

  @override
  Future<List<JokeEntity>> readJokes() {
    throw UnimplementedError();
  }

  @override
  Future<bool> removeJoke({required String uid}) {
    throw UnimplementedError();
  }

  @override
  Future<bool> updateJoke({required JokeEntity joke}) {
    throw UnimplementedError();
  }
}
