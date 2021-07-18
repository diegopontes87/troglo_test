import 'package:get/get.dart';
import 'package:troglo_test/core/data/user/data_source/remote_data_source/user_remote_data_source.dart';
import 'package:troglo_test/core/data/user/repository/user_repository_impl.dart';
import 'package:troglo_test/core/domain/user/repository/user_repository.dart';
import 'package:troglo_test/core/domain/user/usecases/get_user_info_usecase.dart';
import 'package:troglo_test/core/domain/user/usecases/login_with_mail_usecase.dart';
import 'package:troglo_test/core/domain/user/usecases/save_user_info_usecase.dart';
import 'package:troglo_test/core/domain/user/usecases/sign_out_usecase.dart';
import 'package:troglo_test/core/domain/user/usecases/sign_up_with_email_usecase.dart';
import 'package:troglo_test/core/presentation/onboarding/controllers/login_controller.dart';
import 'package:troglo_test/core/presentation/onboarding/controllers/sign_up_credentials_controller.dart';
import 'package:troglo_test/core/presentation/onboarding/controllers/sign_up_info_controller.dart';

class OnboardingBindings extends Bindings {
  @override
  void dependencies() {
    registerControllers();
    registerUsecases();
    registerRepositories();
    registerDataSources();
  }

  void registerControllers() {
    Get.lazyPut<LoginController>(() => LoginController(Get.find<LoginWithEmailUsecase>()));
    Get.lazyPut<SignUpInfoController>(() => SignUpInfoController());
    Get.lazyPut<SignUpCredentialsController>(
      () => SignUpCredentialsController(
        Get.find<SignUpWithEmailUsecase>(),
        Get.find<SaveUserInfoUsecase>(),
      ),
    );
  }

  void registerUsecases() {
    Get.lazyPut<SignUpWithEmailUsecase>(() => SignUpWithEmailUsecase(Get.find<UserRepository>()));
    Get.lazyPut<SignOutUsecase>(() => SignOutUsecase(Get.find<UserRepository>()));
    Get.lazyPut<SaveUserInfoUsecase>(() => SaveUserInfoUsecase(Get.find<UserRepository>()));
    Get.lazyPut<LoginWithEmailUsecase>(() => LoginWithEmailUsecase(Get.find<UserRepository>()));
    Get.lazyPut<GetUserInfoUsecase>(() => GetUserInfoUsecase(Get.find<UserRepository>()));
  }

  void registerRepositories() {
    Get.lazyPut<UserRepository>(() => UserRepositoryImplementation(Get.find<UserRemoteDataSource>()));
  }

  void registerDataSources() {
    Get.lazyPut<UserRemoteDataSource>(() => UserRemoteDataSource());
  }
}
