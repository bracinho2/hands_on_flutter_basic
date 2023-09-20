import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/entities/joke_category_entity.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/usecase/create_joke_usecase.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/usecase/get_joke_categories_usecase.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/usecase/read_jokes_usecase.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/usecase/remove_joke_usecase.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/usecase/update_joke_usecase.dart';

import '../../domain/entities/joke_entity.dart';
import '../state/joke_state.dart';

class JokeStore extends ValueNotifier<JokeState> {
  JokeStore(
    this._createJokeUsecase,
    this._getJokesUsecase,
    this._getJokeCategoriesUsecase,
    this._removeJokeUsecase,
    this._updateJokeUsecase,
  ) : super(JokeLoadingState());

  final CreateJokeUsecase _createJokeUsecase;
  final ReadJokesUsecase _getJokesUsecase;
  final UpdateJokeUsecase _updateJokeUsecase;
  final GetJokeCategoriesUsecase _getJokeCategoriesUsecase;
  final RemoveJokeUsecase _removeJokeUsecase;

  List<JokeEntity> _jokes = [];
  List<JokeCategoryEntity> _categories = [];

  Future<void> init() async {
    await _getJoke();
    setSuccessState();
  }

  void filterList({String? filter}) {
    final state = value as JokeSuccessState;
    if (filter != null) {
      value = state.copyWith(
          joke: _jokes
              .where(
                (element) =>
                    element.name.toLowerCase().contains(filter.toLowerCase()),
              )
              .toList());
    } else {
      value = state.copyWith(joke: _jokes);
    }
  }

  Future<void> updateJoke(
      {required String uid,
      required String name,
      required String details,
      required String avatar}) async {
    final joke = JokeEntity(
      uid: uid,
      name: name,
      details: details,
      avatar: avatar,
    );

    final result = await _updateJokeUsecase.call(joke: joke);
    result.fold(
      (l) => setErrorState(),
      (r) => init(),
    );
  }

  Future<void> createJoke({
    required String name,
    required String details,
    required String avatar,
  }) async {
    var intValue = Random().nextInt(10);
    final joke = JokeEntity(
      uid: intValue.toString(),
      name: name,
      details: details,
      avatar: avatar,
    );
    final result = await _createJokeUsecase.call(
      joke: joke,
    );
    result.fold(
      (l) => setErrorState(),
      (success) => init(),
    );
  }

  Future<void> removeJoke({required String uid}) async {
    final result = await _removeJokeUsecase.call(uid: uid);
    result.fold(
      (l) => null,
      (r) => init(),
    );
  }

  void setSuccessState({List<JokeCategoryEntity>? categories}) {
    if (categories != null) {
      value = JokeSuccessState(joke: _jokes, categories: categories);
    } else {
      value = JokeSuccessState(joke: _jokes, categories: _categories);
    }
  }

  void setErrorState() {
    value = JokeErrorState();
  }

  Future<void> _getJokeCategories() async {
    final result = await _getJokeCategoriesUsecase();
    result.fold(
      (l) => setErrorState(),
      (success) => _categories = success,
    );
  }

  Future<void> _getJoke() async {
    final result = await _getJokesUsecase.call();
    result.fold(
      (error) => setErrorState(),
      (success) => _jokes = success,
    );
  }
}
