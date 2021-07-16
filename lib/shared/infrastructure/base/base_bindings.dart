
import 'package:get/instance_manager.dart';
import 'package:troglo_test/shared/infrastructure/base/base_controller.dart';

class BaseBindings extends Bindings {
  @override
  void dependencies() {}

  void registerControllers() {
    Get.lazyPut<BaseController>(() => BaseController(), fenix: true);
  }
}
