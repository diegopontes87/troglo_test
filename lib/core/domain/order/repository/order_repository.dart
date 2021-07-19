import 'package:multiple_result/multiple_result.dart';
import 'package:troglo_test/core/data/order/entities/order_entity.dart';
import 'package:troglo_test/core/data/order/entities/orders_entity.dart';
import 'package:troglo_test/shared/infrastructure/base/base_http_exceptions.dart';

abstract class OrderRepository {
  Future<Result<BaseHttpExceptions, UserOrdersEntity>> getUserOrders();
  Future<Result<BaseHttpExceptions, bool>> saveUserOrder(OrderEntity orderEntity);
}
