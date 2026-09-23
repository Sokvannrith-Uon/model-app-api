import 'package:vania/service_provider.dart';
import 'package:model_app/route/api_route.dart';


class RouteServiceProvider extends ServiceProvider {
  @override
  Future<void> boot() async {}

  @override
  Future<void> register() async {
    ApiRoute().register();

  }
}
