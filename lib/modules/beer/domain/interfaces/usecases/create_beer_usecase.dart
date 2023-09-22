import 'package:hands_on_flutter_basic/modules/beer/core/typedef/typedef.dart';
import 'package:hands_on_flutter_basic/modules/beer/domain/entities/beer_entity.dart';

abstract class CreateBeerUsecase {
  Future<CreateBeerResult> call({required BeerEntity beer});
}
