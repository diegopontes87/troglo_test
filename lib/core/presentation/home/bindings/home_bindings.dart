import 'package:get/instance_manager.dart';
import 'package:troglo_test/core/presentation/home/controller/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    registerControllers();
    registerUsecases();
    registerRepositories();
    registerDataSources();
  }

  void registerControllers() {
    Get.lazyPut<HomeController>(() => HomeController());
  }

  void registerUsecases() {}

  void registerRepositories() {}

  void registerDataSources() {}
}
