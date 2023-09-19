import 'package:hands_on_flutter_basic/modules/jokes/domain/entities/joke_category_entity.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/entities/joke_entity.dart';

abstract class JokeState {}

class JokeSuccessState extends JokeState {
  final List<JokeEntity> joke;
  final List<JokeCategoryEntity> categories;

  JokeSuccessState({
    required this.joke,
    required this.categories,
  });
}

class JokeErrorState extends JokeState {}

class JokeLoadingState extends JokeState {}
