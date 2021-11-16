import 'package:testing/core/resources.dart';
import 'package:testing/domain/entities/orders_entity.dart';

abstract class OrdersRepository {
  Future<DataState<List<OrdersEntity>>> getOrders();
}
