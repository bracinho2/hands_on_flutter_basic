import 'package:hands_on_flutter_basic/modules/beer/domain/entities/beer_entity.dart';

abstract class BeerState {}

class BeerLoadingState extends BeerState {}

class BeerSuccessState extends BeerState {
  final List<BeerEntity> beers;

  BeerSuccessState({
    required this.beers,
  });
}

class BeerErrorState extends BeerState {}
