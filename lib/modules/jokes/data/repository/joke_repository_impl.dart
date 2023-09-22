import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hands_on_flutter_basic/modules/jokes/core/typedef/typedef.dart';
import 'package:hands_on_flutter_basic/modules/jokes/data/datasource/joke_datasource.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/entities/joke_entity.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/repository/joke_repository.dart';

import '../../domain/errors/errors.dart';

class JokeRepositoryImpl implements JokeRepository {
  final JokeDatasource _datasource;

  @override
  Future<CreateJokeResult> createJoke({required JokeEntity joke}) async {
    try {
      final result = await _datasource.createJoke(joke: joke);
      return Right(result);
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      return Left(JokeRepositoryError());
    }
  }

  JokeRepositoryImpl(this._datasource);
  @override
  Future<ReadJokesResult> readJokes() async {
    try {
      final result = await _datasource.readJokes();
      return Right(result);
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      return Left(JokeRepositoryError());
    }
  }

  @override
  Future<UpdateJokeResult> updateJoke({required JokeEntity joke}) async {
    try {
      final result = await _datasource.updateJoke(joke: joke);
      return Right(result);
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      return Left(JokeRepositoryError());
    }
  }

  @override
  Future<DeleteJokeResult> removeJoke({required String uid}) async {
    try {
      final result = await _datasource.removeJoke(uid: uid);
      return Right(result);
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      return Left(JokeRepositoryError());
    }
  }
}
