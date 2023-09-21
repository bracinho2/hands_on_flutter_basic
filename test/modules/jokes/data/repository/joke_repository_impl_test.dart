import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hands_on_flutter_basic/modules/jokes/data/datasource/joke_datasource.dart';
import 'package:hands_on_flutter_basic/modules/jokes/data/repository/joke_repository_impl.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/entities/joke_entity.dart';

import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/repository/joke_repository.dart';
import 'package:mocktail/mocktail.dart';

class JokeDatasourceMock extends Mock implements JokeDatasource {}

void main() {
  late JokeDatasource datasource;
  late JokeRepository repository;

  setUpAll(() {
    datasource = JokeDatasourceMock();
    repository = JokeRepositoryImpl(datasource);
  });

  tearDownAll(() {
    datasource;
    repository;
  });

  final joke = JokeEntity(
    uid: 'uid',
    name: 'name',
    details: 'details',
    avatar: 'avatar',
  );

  final jokes = [
    JokeEntity(
      uid: 'uid',
      name: 'name',
      details: 'details',
      avatar: 'avatar',
    ),
  ];

  const uid = 'uid';

  group('RepositoryJoke', () {
    ///CREATE JOKES
    test('should create a joke successfully', () async {
      // Arrange
      when(
        () => datasource.createJoke(joke: joke),
      ).thenAnswer((_) async => true);

      // Act
      final result = await repository.createJoke(joke: joke);

      // Assert
      expect(result.fold(id, id), isTrue);
      verify(() => datasource.createJoke(joke: joke)).called(1);
    });

    test('should create a joke unsuccessfully', () async {
      // Arrange
      when(
        () => datasource.createJoke(joke: joke),
      ).thenAnswer((_) async => false);

      // Act
      final result = await repository.createJoke(joke: joke);

      // Assert
      expect(result.fold(id, id), isFalse);
      verify(() => datasource.createJoke(joke: joke)).called(1);
    });

    test('should handle joke creation failure', () async {
      // Arrange
      when(
        () => datasource.createJoke(joke: joke),
      ).thenThrow(Exception());

      // Act
      final result = await repository.createJoke(joke: joke);

      // Assert
      expect(result.isLeft(), isTrue);
      verify(() => datasource.createJoke(joke: joke)).called(1);
    });

    ///READ JOKES
    test('should return an empty jokes list', () async {
      // Arrange
      when(
        () => datasource.readJokes(),
      ).thenAnswer((_) async => []);

      // Act
      final result = await repository.readJokes();

      // Assert
      expect(result.fold(id, id), isEmpty);
      verify(() => datasource.readJokes()).called(1);
    });

    test('should return an jokes list', () async {
      // Arrange
      when(
        () => datasource.readJokes(),
      ).thenAnswer((_) async => jokes);

      // Act
      final result = await repository.readJokes();

      // Assert
      expect(result.fold(id, id), isNotEmpty);
      verify(() => repository.readJokes()).called(1);
    });

    test('should handle joke read failure', () async {
      // Arrange
      when(
        () => datasource.readJokes(),
      ).thenThrow(Exception());

      // Act
      final result = await repository.readJokes();

      // Assert
      expect(result.isLeft(), isTrue);
      verify(() => repository.readJokes()).called(1);
    });

    //UPDATE JOKES;
    test('should update a joke successfully', () async {
      // Arrange
      when(
        () => datasource.updateJoke(joke: joke),
      ).thenAnswer((_) async => true);

      // Act
      final result = await repository.updateJoke(joke: joke);

      // Assert
      expect(result.fold(id, id), isTrue);
      verify(() => repository.updateJoke(joke: joke)).called(1);
    });

    test('should update a joke unsuccessfully', () async {
      // Arrange
      when(
        () => datasource.updateJoke(joke: joke),
      ).thenAnswer((_) async => false);

      // Act
      final result = await repository.updateJoke(joke: joke);

      // Assert
      expect(result.fold(id, id), isFalse);
      verify(() => repository.updateJoke(joke: joke)).called(1);
    });

    test('should handle joke update failure', () async {
      // Arrange
      when(
        () => datasource.updateJoke(joke: joke),
      ).thenThrow(Exception());

      // Act
      final result = await repository.updateJoke(joke: joke);

      // Assert
      expect(result.isLeft(), isTrue);
      verify(() => repository.updateJoke(joke: joke)).called(1);
    });

    //REMOVE JOKE
    test('should remove a joke successfully', () async {
      // Arrange
      when(
        () => datasource.removeJoke(uid: uid),
      ).thenAnswer((_) async => true);

      // Act
      final result = await repository.removeJoke(uid: uid);

      // Assert
      expect(result.fold(id, id), isTrue);
      verify(() => datasource.removeJoke(uid: uid)).called(1);
    });

    test('should remove a joke unsuccessfully', () async {
      // Arrange
      when(
        () => datasource.removeJoke(uid: uid),
      ).thenAnswer((_) async => false);

      // Act
      final result = await repository.removeJoke(uid: uid);

      // Assert
      expect(result.fold(id, id), isFalse);
      verify(() => datasource.removeJoke(uid: uid)).called(1);
    });

    test('should handle joke creation failure', () async {
      // Arrange
      when(
        () => datasource.removeJoke(uid: uid),
      ).thenThrow(Exception());

      // Act
      final result = await repository.removeJoke(uid: uid);

      // Assert
      expect(result.isLeft(), isTrue);
      verify(() => datasource.removeJoke(uid: uid)).called(1);
    });
  });
}
