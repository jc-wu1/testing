import 'package:testing/core/order_detail_params.dart';
import 'package:testing/core/resources.dart';
import 'package:testing/domain/entities/order_entity.dart';

abstract class OrderRepository {
  Future<DataState<OrderEntity>> getOrder(OrderDetailParams param);
}
