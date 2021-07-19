import 'package:troglo_test/core/data/order/data_source/remote_data_source/order_remote_data_source.dart';
import 'package:troglo_test/core/data/order/entities/orders_entity.dart';
import 'package:troglo_test/core/data/order/entities/order_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:troglo_test/core/domain/order/repository/order_repository.dart';
import 'package:troglo_test/shared/infrastructure/base/base_http_exceptions.dart';

class OrderRepositoryImplementation implements OrderRepository {
  OrderRemoteDataSource _orderRemoteDataSource;

  OrderRepositoryImplementation(this._orderRemoteDataSource);
  @override
  Future<Result<BaseHttpExceptions, UserOrdersEntity>> getUserOrders() async {
    return await _orderRemoteDataSource.getUserOrders();
  }

  @override
  Future<Result<BaseHttpExceptions, bool>> saveUserOrder(OrderEntity orderEntity) async {
    return await _orderRemoteDataSource.saveUserOrder(orderEntity);
  }
}
