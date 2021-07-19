import 'package:troglo_test/core/domain/order/usecases/get_user_orders_usecases.dart';
import 'package:troglo_test/core/domain/tests/usecases/get_tests_info_usecase.dart';
import 'package:troglo_test/core/domain/user/usecases/get_user_info_usecase.dart';
import 'package:troglo_test/shared/infrastructure/base/base_controller.dart';

class HomeController extends BaseController {
  GetUserInfoUsecase _getUserInfoUsecase;
  GetTestsInfoUsecase _getTestsInfoUsecase;
  GetUserOrdersUsecase _getUserOrdersUsecase;
  HomeController(
    this._getUserInfoUsecase,
    this._getTestsInfoUsecase,
    this._getUserOrdersUsecase,
  );
}
