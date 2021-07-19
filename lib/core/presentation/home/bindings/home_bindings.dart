import 'package:get/instance_manager.dart';
import 'package:troglo_test/core/data/order/data_source/remote_data_source/order_remote_data_source.dart';
import 'package:troglo_test/core/data/order/repository/order_repository_impl.dart';
import 'package:troglo_test/core/data/tests/data_source/remote_data_source/tests_remote_data_source.dart';
import 'package:troglo_test/core/data/tests/repository/tests_repository_impl.dart';
import 'package:troglo_test/core/data/user/data_source/remote_data_source/user_remote_data_source.dart';
import 'package:troglo_test/core/data/user/repository/user_repository_impl.dart';
import 'package:troglo_test/core/domain/order/repository/order_repository.dart';
import 'package:troglo_test/core/domain/order/usecases/get_user_orders_usecases.dart';
import 'package:troglo_test/core/domain/tests/repository/tests_repository.dart';
import 'package:troglo_test/core/domain/tests/usecases/get_tests_info_usecase.dart';
import 'package:troglo_test/core/domain/user/repository/user_repository.dart';
import 'package:troglo_test/core/domain/user/usecases/get_user_info_usecase.dart';
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
    Get.lazyPut<HomeController>(
      () => HomeController(
        Get.find<GetUserInfoUsecase>(),
        Get.find<GetTestsInfoUsecase>(),
        Get.find<GetUserOrdersUsecase>(),
      ),
    );
  }

  void registerUsecases() {
    Get.lazyPut<GetUserInfoUsecase>(() => GetUserInfoUsecase(Get.find<UserRepository>()));
    Get.lazyPut<GetUserOrdersUsecase>(() => GetUserOrdersUsecase(Get.find<OrderRepository>()));
    Get.lazyPut<GetTestsInfoUsecase>(() => GetTestsInfoUsecase(Get.find<TestsRepository>()));
  }

  void registerRepositories() {
    Get.lazyPut<UserRepository>(() => UserRepositoryImplementation(Get.find<UserRemoteDataSource>()));
    Get.lazyPut<OrderRepository>(() => OrderRepositoryImplementation(Get.find<OrderRemoteDataSource>()));
    Get.lazyPut<TestsRepository>(() => TestsRepositoryImplementation(Get.find<TestsRemoteDataSource>()));
  }

  void registerDataSources() {
    Get.lazyPut<UserRemoteDataSource>(() => UserRemoteDataSource());
    Get.lazyPut<OrderRemoteDataSource>(() => OrderRemoteDataSource());
    Get.lazyPut<TestsRemoteDataSource>(() => TestsRemoteDataSource());
  }
}
