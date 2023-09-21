import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/entities/joke_entity.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/errors/errors.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/repository/joke_repository.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/usecase/create_joke_usecase.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/usecases/create_joke.dart';
import 'package:mocktail/mocktail.dart';

class JokeRepositoryMock extends Mock implements JokeRepository {}

void main() {
  late JokeRepository repository;
  late CreateJokeUsecase usecase;

  setUpAll(() {
    repository = JokeRepositoryMock();
    usecase = CreateJoke(repository);
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

  group('CreateJoke', () {
    test('should create a joke successfully', () async {
      // Arrange
      when(
        () => repository.createJoke(joke: joke),
      ).thenAnswer((_) async => const Right(true));

      // Act
      final result = await usecase.call(joke: joke);

      // Assert
      expect(result.fold(id, id), isTrue);
      verify(() => repository.createJoke(joke: joke)).called(1);
    });

    test('should create a joke unsuccessfully', () async {
      // Arrange
      when(
        () => repository.createJoke(joke: joke),
      ).thenAnswer((_) async => const Right(false));

      // Act
      final result = await usecase.call(joke: joke);

      // Assert
      expect(result.fold(id, id), isFalse);
      verify(() => repository.createJoke(joke: joke)).called(1);
    });

    test('should handle joke creation failure', () async {
      // Arrange
      when(
        () => repository.createJoke(joke: joke),
      ).thenAnswer((_) async => Left(error));

      // Act
      final result = await usecase.call(joke: joke);

      // Assert
      expect(result.fold(id, id), error);
      verify(() => repository.createJoke(joke: joke)).called(1);
    });
  });
}
