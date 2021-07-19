import 'package:troglo_test/core/data/order/entities/order_entity.dart';

class OrderModel {
  String? userId;
  String? test;
  String? testInfo;
  String? orderDate;
  String? orderId;

  OrderModel({
    this.userId,
    this.test,
    this.testInfo,
    this.orderDate,
    this.orderId,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    test = json['test'];
    testInfo = json['testInfo'];
    orderDate = json['orderDate'];
    orderId = json['orderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['test'] = this.test;
    data['testInfo'] = this.testInfo;
    data['orderDate'] = this.orderDate;
    data['orderId'] = this.orderId;
    return data;
  }
}

extension Mapper on OrderModel {
  OrderEntity toEntity() {
    return OrderEntity(
      userId: this.userId,
      test: this.test,
      testInfo: this.testInfo,
      orderDate: this.orderDate,
      orderId: this.orderId,
    );
  }
}
