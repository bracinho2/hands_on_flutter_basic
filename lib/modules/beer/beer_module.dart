import 'package:flutter_modular/flutter_modular.dart';
import 'package:hands_on_flutter_basic/modules/beer/data/repository/beer_repository_impl.dart';
import 'package:hands_on_flutter_basic/modules/beer/domain/usecases/read_beer.dart';
import 'package:hands_on_flutter_basic/modules/beer/presenter/pages/beer_page.dart';
import 'package:hands_on_flutter_basic/modules/beer/presenter/store/beer_store.dart';

import 'data/endpoint/beer_memory_endpoint.dart';

class BeerModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => BeerMemoryEndpoint()),
        Bind.lazySingleton((i) => BeerRepositoryImpl(i())),
        Bind.lazySingleton((i) => ReadBeer(i())),
        Bind.lazySingleton((i) => BeerStore(
              i(),
            )),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => BeerPage(
            store: context.read(),
          ),
        ),
      ];
}
