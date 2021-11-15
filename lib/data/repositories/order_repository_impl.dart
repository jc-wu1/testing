import 'dart:io';

import 'package:dio/dio.dart';
import 'package:testing/data/datasources/remote/order_api_services.dart';
import 'package:testing/domain/entities/order_entity.dart';
import 'package:testing/core/resources.dart';
import 'package:testing/domain/repositories/orderrepository.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final OrderApiService _orderApiService;
  const OrdersRepositoryImpl(this._orderApiService);

  @override
  Future<DataState<List<Orders>>> getOrders() async {
    try {
      final httpResponse = await _orderApiService.getOrders();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.orders);
      }
      return DataFailure(
        DioError(
          error: httpResponse.response.statusCode,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
          response: httpResponse.response,
        ),
      );
    } on DioError catch (e) {
      return DataFailure(e);
    }
  }
}
