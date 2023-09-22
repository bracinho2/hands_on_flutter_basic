import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hands_on_flutter_basic/modules/beer/data/datasource/beer_datasource.dart';
import 'package:hands_on_flutter_basic/modules/beer/domain/entities/beer_entity.dart';
import 'package:hands_on_flutter_basic/modules/beer/core/typedef/typedef.dart';
import 'package:hands_on_flutter_basic/modules/beer/domain/interfaces/repository/beer_repository.dart';
import 'package:hands_on_flutter_basic/modules/beer/errors/beer_errors.dart';

class BeerRepositoryImpl implements BeerRepository {
  final BeerDatasource _datasource;
  BeerRepositoryImpl(this._datasource);

  @override
  Future<CreateBeerResult> createBeer({required BeerEntity beer}) async {
    try {
      final result = await _datasource.createBeer(beer: beer);
      return Right(result);
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      return Left(BeerRepositoryError());
    }
  }

  @override
  Future<DeleteBeerResult> deleteBeer({required String uid}) async {
    try {
      return Right(await _datasource.deleteBeer(uid: uid));
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      return Left(BeerRepositoryError());
    }
  }

  @override
  Future<ReadBeerResult> readBeer() async {
    try {
      final response = await _datasource.readBeer();
      return Right(response);
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      return Left(BeerRepositoryError());
    }
  }

  @override
  Future<UpdateBeerResult> updateBeer({required BeerEntity beer}) async {
    try {
      return Right(await _datasource.updateBeer(beer: beer));
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      return Left(BeerRepositoryError());
    }
  }
}
