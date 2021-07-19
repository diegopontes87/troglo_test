import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:troglo_test/core/data/order/entities/order_entity.dart';
import 'package:troglo_test/core/data/order/models/order_model.dart';
import 'package:troglo_test/shared/infrastructure/base/base_http_exceptions.dart';
import 'package:troglo_test/shared/infrastructure/base/base_remote_datasource.dart';
import 'package:troglo_test/shared/res/app_http.dart';

class OrderRemoteDataSource extends BaseRemoteDataSource {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Result<BaseHttpExceptions, bool>> saveUserOrder(OrderEntity orderEntity) async {
    try {
      orderEntity.userId = _auth.currentUser?.uid;
      print(orderEntity.toModel().toJson());
      var result = await client.post(AppHttp.orders, data: json.encode(orderEntity.toModel().toJson()));
      if (result.statusCode == 201) {
        return Success(true);
      }
      return Error(BaseHttpExceptions(error: 'Error', errorMessage: 'Could not save user order on database! Please try again!'));
    } on PlatformException catch (error, stacktrace) {
      print('IO Exception Error while trying to save user information sales: $error');
      print('Error stacktrace: $stacktrace');
      return Error(BaseHttpExceptions(error: 'Error', errorMessage: 'Could not save user order on database! Please try again!'));
    }
  }

  Future<Result<BaseHttpExceptions, List<OrderEntity>?>> getTestsInfo() async {
    try {
      var userId = _auth.currentUser?.uid;
      var result = await client.post('${AppHttp.orders}/$userId');
      List<OrderEntity> ordersList =
          List<OrderEntity>.from(result.data.map((apiData) => OrderModel.fromJson(Map<String, dynamic>.from(apiData)).toEntity()).toList());
      return Success(ordersList);
    } on PlatformException catch (error, stacktrace) {
      print('IO Exception Error while trying get user tests results: $error');
      print('Error stacktrace: $stacktrace');
      return Error(BaseHttpExceptions(error: 'Error', errorMessage: 'Could not get user tests results!'));
    }
  }
}
