import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/errors/errors.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/repository/joke_repository.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/usecase/remove_joke_usecase.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/usecases/remove_joke.dart';
import 'package:mocktail/mocktail.dart';

class JokeRepositoryMock extends Mock implements JokeRepository {}

void main() {
  late JokeRepository repository;
  late RemoveJokeUsecase usecase;

  setUpAll(() {
    repository = JokeRepositoryMock();
    usecase = RemoveJoke(repository);
  });

  tearDownAll(() {
    repository;
    usecase;
  });

  const uid = 'uid';

  final error = JokeRepositoryError();

  group('RemoveJoke', () {
    test('should remove a joke successfully', () async {
      // Arrange
      when(
        () => repository.removeJoke(uid: uid),
      ).thenAnswer((_) async => const Right(true));

      // Act
      final result = await usecase.call(uid: uid);

      // Assert
      expect(result.fold(id, id), isTrue);
      verify(() => repository.removeJoke(uid: uid)).called(1);
    });

    test('should remove a joke unsuccessfully', () async {
      // Arrange
      when(
        () => repository.removeJoke(uid: uid),
      ).thenAnswer((_) async => const Right(false));

      // Act
      final result = await usecase.call(uid: uid);

      // Assert
      expect(result.fold(id, id), isFalse);
      verify(() => repository.removeJoke(uid: uid)).called(1);
    });

    test('should handle joke remove failure', () async {
      // Arrange
      when(
        () => repository.removeJoke(uid: uid),
      ).thenAnswer((_) async => Left(error));

      // Act
      final result = await usecase.call(uid: uid);

      // Assert
      expect(result.fold(id, id), error);
      verify(() => repository.removeJoke(uid: uid)).called(1);
    });
  });
}
