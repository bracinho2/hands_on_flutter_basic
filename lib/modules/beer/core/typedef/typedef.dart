import 'package:dartz/dartz.dart';
import 'package:hands_on_flutter_basic/modules/beer/errors/beer_errors.dart';

import '../../domain/entities/beer_entity.dart';

typedef CreateBeerResult = Either<BeerErrors, bool>;
typedef ReadBeerResult = Either<BeerErrors, List<BeerEntity>>;
typedef UpdateBeerResult = Either<BeerErrors, bool>;
typedef DeleteBeerResult = Either<BeerErrors, bool>;
