import 'package:flutter/material.dart';
import 'package:hands_on_flutter_basic/modules/beer/domain/entities/beer_entity.dart';
import 'package:hands_on_flutter_basic/modules/beer/domain/interfaces/usecases/read_beer_usecase.dart';

import '../state/beer_state.dart';

class BeerStore extends ValueNotifier<BeerState> {
  BeerStore(this._readBeerUsecase) : super(BeerLoadingState());

  final ReadBeerUsecase _readBeerUsecase;

  List<BeerEntity> beers = [];

  Future<void> init() async {
    await getBeers();
  }

  Future<void> getBeers() async {
    final result = await _readBeerUsecase.call();
    result.fold(
      (l) => null,
      (success) {
        beers = success;
      },
    );
    value = BeerSuccessState(beers: beers);
  }
}
