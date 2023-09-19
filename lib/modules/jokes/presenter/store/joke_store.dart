import 'package:flutter/material.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/entities/joke_category_entity.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/usecase/get_joke_categories_usecase.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/usecase/read_jokes_usecase.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/usecase/remove_joke_usecase.dart';

import '../../domain/entities/joke_entity.dart';
import '../state/joke_state.dart';

class JokeStore extends ValueNotifier<JokeState> {
  JokeStore(
    this._getJokesUsecase,
    this._getJokeCategoriesUsecase,
    this._removeJokeUsecase,
  ) : super(JokeLoadingState());

  final ReadJokesUsecase _getJokesUsecase;
  final GetJokeCategoriesUsecase _getJokeCategoriesUsecase;
  final RemoveJokeUsecase _removeJokeUsecase;

  List<JokeEntity> joke = [];
  List<JokeCategoryEntity> _categories = [];

  Future<void> init() async {
    await _getJoke();
    setSuccessState();
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
      value = JokeSuccessState(joke: joke, categories: categories);
    } else {
      value = JokeSuccessState(joke: joke, categories: _categories);
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
      (success) => joke = success,
    );
  }
}
