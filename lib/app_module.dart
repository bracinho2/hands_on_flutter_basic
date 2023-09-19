import 'package:flutter_modular/flutter_modular.dart';
import 'package:hands_on_flutter_basic/core/splash/splash_page.dart';

import 'core/core_module.dart';
import 'modules/jokes/joke_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
        JokeModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: ((context, args) => const SplashPage()),
        ),
        ModuleRoute(
          '/jokes',
          module: JokeModule(),
        ),
      ];
}
