import 'package:troglo_test/core/data/order/models/order_model.dart';

class OrderEntity {
  String? userId;
  String? test;
  String? testInfo;
  String? orderDate;
  String? orderId;

  OrderEntity({
    this.userId,
    this.test,
    this.testInfo,
    this.orderDate,
    this.orderId,
  });
}

extension Mapper on OrderEntity {
  OrderModel toModel() {
    return OrderModel(
      userId: this.userId,
      test: this.test,
      testInfo: this.testInfo,
      orderDate: this.orderDate,
      orderId: this.orderId,
    );
  }
}
