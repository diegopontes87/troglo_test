import 'package:multiple_result/multiple_result.dart';
import 'package:troglo_test/core/data/order/entities/order_entity.dart';
import 'package:troglo_test/core/domain/order/repository/order_repository.dart';
import 'package:troglo_test/shared/infrastructure/base/base_http_exceptions.dart';
import 'package:troglo_test/shared/infrastructure/base/base_usecase.dart';

class SaveUserOrderUsecase implements BaseFutureUsecase<OrderEntity, Result<BaseHttpExceptions, bool>> {
  OrderRepository _repository;

  SaveUserOrderUsecase(this._repository);
  @override
  Future<Result<BaseHttpExceptions, bool>> call(OrderEntity orderEntity) async {
    return await _repository.saveUserOrder(orderEntity);
  }
}
