import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hands_on_flutter_basic/core/services/api_client/my_api_client.dart';
import 'package:hands_on_flutter_basic/core/services/api_client/my_api_client_dio.dart';

class CoreModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => Dio(),
          export: true,
        ),
        Bind.lazySingleton<MyApiClient>(
          (i) => MyApiClientDio(
            i(),
          ),
          export: true,
        ),
      ];
}
