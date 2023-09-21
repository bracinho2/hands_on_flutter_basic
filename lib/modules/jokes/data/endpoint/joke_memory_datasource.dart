import 'package:hands_on_flutter_basic/core/mocks/jokes.dart';

import 'package:hands_on_flutter_basic/modules/jokes/data/datasource/joke_datasource.dart';
import 'package:hands_on_flutter_basic/modules/jokes/data/mappers/joke_entity_mapper.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/entities/joke_category_entity.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/entities/joke_entity.dart';

class JokeMemoryDatasource implements JokeDatasource {
  final _memoryList =
      jsonJokes.map((json) => JokeEntityMapper.fromMap(map: json)).toList();

  @override
  Future<bool> createJoke({required JokeEntity joke}) async {
    _memoryList.add(joke);
    _memoryList.sort(((a, b) => a.uid.compareTo(b.uid)));

    return true;
  }

  @override
  Future<List<JokeEntity>> readJokes() async {
    return _memoryList;
  }

  @override
  Future<bool> updateJoke({required JokeEntity joke}) async {
    var data = _memoryList.firstWhere((element) => element.uid == joke.uid);
    _memoryList.remove(data);
    _memoryList.add(joke);
    _memoryList.sort(((a, b) => a.uid.compareTo(b.uid)));
    return true;
  }

  @override
  Future<bool> removeJoke({required String uid}) async {
    _memoryList.remove(_memoryList.firstWhere((element) => element.uid == uid));
    _memoryList.sort(((a, b) => a.uid.compareTo(b.uid)));
    return true;
  }

  Future<JokeEntity> getById({required String id}) async {
    return _memoryList.firstWhere((element) => element.uid == id);
  }

  @override
  Future<List<JokeCategoryEntity>> getJokeCategories() {
    // TODO: implement getJokeCategories
    throw UnimplementedError();
  }
}
