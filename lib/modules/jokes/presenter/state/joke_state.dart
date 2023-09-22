import 'package:hands_on_flutter_basic/modules/jokes/domain/entities/joke_entity.dart';

abstract class JokeState {}

class JokeSuccessState extends JokeState {
  final List<JokeEntity> joke;

  JokeSuccessState({
    required this.joke,
  });

  JokeSuccessState copyWith({
    List<JokeEntity>? joke,
  }) {
    return JokeSuccessState(
      joke: joke ?? this.joke,
    );
  }
}

class JokeErrorState extends JokeState {}

class JokeLoadingState extends JokeState {}

class CreateJokeState extends JokeState {}
