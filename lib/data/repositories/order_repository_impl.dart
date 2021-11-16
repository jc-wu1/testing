import 'dart:io';

import 'package:dio/dio.dart';
import 'package:testing/data/datasources/remote/order_api_services.dart';
import 'package:testing/domain/entities/order_entity.dart';
import 'package:testing/core/resources.dart';
import 'package:testing/core/order_detail_params.dart';
import 'package:testing/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderApiService orderApiService;

  OrderRepositoryImpl(this.orderApiService);

  @override
  Future<DataState<OrderEntity>> getOrder(OrderDetailParams param) async {
    try {
      final httpResponse = await orderApiService.getOrder(param.orderid);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.order);
      } else {
        return DataFailure(
          DioError(
            error: httpResponse.response.statusMessage,
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioErrorType.response,
          ),
        );
      }
    } on DioError catch (e) {
      return DataFailure(e);
    }
  }
}
