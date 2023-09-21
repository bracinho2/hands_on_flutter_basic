import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/entities/joke_entity.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/errors/errors.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/repository/joke_repository.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/usecase/update_joke_usecase.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/usecases/update_joke.dart';
import 'package:mocktail/mocktail.dart';

class JokeRepositoryMock extends Mock implements JokeRepository {}

void main() {
  late JokeRepository repository;
  late UpdateJokeUsecase usecase;

  setUpAll(() {
    repository = JokeRepositoryMock();
    usecase = UpdateJoke(repository);
  });

  tearDownAll(() {
    repository;
    usecase;
  });

  final joke = JokeEntity(
    uid: 'uid',
    name: 'name',
    details: 'details',
    avatar: 'avatar',
  );

  final error = JokeRepositoryError();

  group('UpdateJoke', () {
    test('should update a joke successfully', () async {
      // Arrange
      when(
        () => repository.updateJoke(joke: joke),
      ).thenAnswer((_) async => const Right(true));

      // Act
      final result = await usecase.call(joke: joke);

      // Assert
      expect(result.fold(id, id), isTrue);
      verify(() => repository.updateJoke(joke: joke)).called(1);
    });

    test('should update a joke unsuccessfully', () async {
      // Arrange
      when(
        () => repository.updateJoke(joke: joke),
      ).thenAnswer((_) async => const Right(false));

      // Act
      final result = await usecase.call(joke: joke);

      // Assert
      expect(result.fold(id, id), isFalse);
      verify(() => repository.updateJoke(joke: joke)).called(1);
    });

    test('should handle joke update failure', () async {
      // Arrange
      when(
        () => repository.updateJoke(joke: joke),
      ).thenAnswer((_) async => Left(error));

      // Act
      final result = await usecase.call(joke: joke);

      // Assert
      expect(result.fold(id, id), error);
      verify(() => repository.updateJoke(joke: joke)).called(1);
    });
  });
}
