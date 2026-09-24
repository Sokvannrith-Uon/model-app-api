import 'package:model_app/app/http/controllers/product_controller.dart';
import 'package:vania/route.dart';
import 'package:model_app/app/http/controllers/home_controller.dart';

class ApiRoute extends Route {
  @override
  String prefix = 'api/v1';

  @override
  void register() {
    super.register();
    Router.get("/home", homeController.index);
    Router.get("/products", productController.getProducts);
    Router.get("/products/{id}", productController.getProductById);
  }
}
