import 'package:hands_on_flutter_basic/modules/jokes/domain/entities/joke_category_entity.dart';

class JokeCategoryEntityMapper {
  static JokeCategoryEntity fromMap({required String value}) {
    return JokeCategoryEntity(
      category: value,
    );
  }
}
