import 'package:troglo_test/core/data/order/entities/order_entity.dart';
import 'package:troglo_test/core/data/order/entities/orders_entity.dart';

import 'order_model.dart';

class UserOrdersModel {
  List<OrderModel>? userOrders;

  UserOrdersModel({this.userOrders});

  UserOrdersModel.fromJson(Map<String, dynamic> json) {
    if (json['userOrders'] != null) {
      userOrders = [];
      json['userOrders'].forEach((v) {
        userOrders?.add(new OrderModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userOrders != null) {
      data['userOrders'] = this.userOrders?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

extension Mapper on UserOrdersModel {
  UserOrdersEntity toEntity() {
    return UserOrdersEntity(userOrders: this.userOrders.toEntityList());
  }
}

extension ListMapper on List<OrderModel>? {
  List<OrderEntity> toEntityList() {
    List<OrderEntity> list = [];
    this?.forEach((element) {
      element.toEntity();
    });
    return list;
  }
}
