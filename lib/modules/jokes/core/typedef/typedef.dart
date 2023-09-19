import 'package:dartz/dartz.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/entities/joke_category_entity.dart';

import '../../domain/entities/joke_entity.dart';
import '../../domain/errors/errors.dart';

typedef CreateJokeResult = Either<JokeError, bool>;
typedef ReadJokesResult = Either<JokeError, List<JokeEntity>>;
typedef UpdateJokeResult = Either<JokeError, bool>;
typedef RemoveJokeResult = Either<JokeError, bool>;
typedef GetJokesCategoryResult = Either<JokeError, List<JokeCategoryEntity>>;
