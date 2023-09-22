import 'package:hands_on_flutter_basic/modules/beer/domain/entities/beer_entity.dart';

class BeerEntityMapper {
  static BeerEntity fromMap({required Map<String, dynamic> map}) {
    return BeerEntity(
      uid: map['uid'],
      brand: map['brand'],
      city: map['city'],
    );
  }
}
