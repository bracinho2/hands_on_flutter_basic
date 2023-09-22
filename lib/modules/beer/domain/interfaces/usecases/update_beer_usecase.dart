import 'package:hands_on_flutter_basic/modules/beer/core/typedef/typedef.dart';
import 'package:hands_on_flutter_basic/modules/beer/domain/entities/beer_entity.dart';

abstract class UpdateBeerUsecase {
  Future<UpdateBeerResult> call({required BeerEntity beer});
}
