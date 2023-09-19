import 'package:flutter_modular/flutter_modular.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/usecase/get_joke_categories_usecase.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/interfaces/usecase/remove_joke_usecase.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/usecases/get_joke_categories.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/usecases/remove_joke.dart';
import 'package:hands_on_flutter_basic/modules/jokes/presenter/pages/add_joke_page.dart';

import 'data/datasource/joke_datasource.dart';
import 'data/endpoint/joke_memory_datasource.dart';
import 'data/repository/joke_repository_impl.dart';
import 'domain/interfaces/repository/joke_repository.dart';
import 'domain/interfaces/usecase/read_jokes_usecase.dart';
import 'domain/usecases/read_jokes.dart';
import 'presenter/pages/list_jokes_page.dart';
import 'presenter/store/joke_store.dart';

class JokeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<JokeDatasource>((i) => JokeMemoryDatasource()),
        Bind.lazySingleton<JokeRepository>((i) => JokeRepositoryImpl(i())),
        Bind.lazySingleton<GetJokeCategoriesUsecase>(
            (i) => GetJokeCategories(i())),

        //Usecases
        Bind.lazySingleton<RemoveJokeUsecase>((i) => RemoveJoke(i())),
        Bind.lazySingleton<ReadJokesUsecase>((i) => GetJokes(i())),
        Bind.lazySingleton<JokeStore>((i) => JokeStore(i(), i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => ListJokesPage(
            store: context.read(),
          ),
        ),
        ChildRoute(
          '/add',
          child: (context, args) => const AddJokePage(),
        ),
      ];
}
