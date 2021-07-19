import 'package:multiple_result/multiple_result.dart';
import 'package:troglo_test/core/data/order/entities/orders_entity.dart';
import 'package:troglo_test/core/domain/order/repository/order_repository.dart';
import 'package:troglo_test/shared/infrastructure/base/base_http_exceptions.dart';
import 'package:troglo_test/shared/infrastructure/base/base_usecase.dart';
import 'package:troglo_test/shared/infrastructure/entities/no_params.dart';

class GetUserOrdersUsecase implements BaseFutureUsecase<NoParams, Result<BaseHttpExceptions, UserOrdersEntity>> {
  OrderRepository _repository;

  GetUserOrdersUsecase(this._repository);
  @override
  Future<Result<BaseHttpExceptions, UserOrdersEntity>> call(NoParams input) async {
    return await _repository.getUserOrders();
  }
}
