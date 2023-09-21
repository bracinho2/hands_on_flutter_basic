import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/entities/joke_entity.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/errors/errors.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/repository/joke_repository.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/usecase/read_jokes_usecase.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/usecases/read_jokes.dart';
import 'package:mocktail/mocktail.dart';

class JokeRepositoryMock extends Mock implements JokeRepository {}

void main() {
  late JokeRepository repository;
  late ReadJokesUsecase usecase;

  setUpAll(() {
    repository = JokeRepositoryMock();
    usecase = ReadJokes(repository);
  });

  tearDownAll(() {
    repository;
    usecase;
  });

  final jokes = [
    JokeEntity(
      uid: 'uid',
      name: 'name',
      details: 'details',
      avatar: 'avatar',
    ),
  ];

  final error = JokeRepositoryError();

  group('ReadJokes', () {
    test('should return an empty jokes list', () async {
      // Arrange
      when(
        () => repository.readJokes(),
      ).thenAnswer((_) async => const Right([]));

      // Act
      final result = await usecase.call();

      // Assert
      expect(result.fold(id, id), isEmpty);
      verify(() => repository.readJokes()).called(1);
    });

    test('should return an jokes list', () async {
      // Arrange
      when(
        () => repository.readJokes(),
      ).thenAnswer((_) async => Right(jokes));

      // Act
      final result = await usecase.call();

      // Assert
      expect(result.fold(id, id), isNotEmpty);
      verify(() => repository.readJokes()).called(1);
    });

    test('should handle joke creation failure', () async {
      // Arrange
      when(
        () => repository.readJokes(),
      ).thenAnswer((_) async => Left(error));

      // Act
      final result = await usecase.call();

      // Assert
      expect(result.fold(id, id), error);
      verify(() => repository.readJokes()).called(1);
    });
  });
}
