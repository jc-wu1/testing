import 'package:testing/core/resources.dart';
import 'package:testing/domain/entities/order_entity.dart';

abstract class OrdersRepository {
  Future<DataState<List<Orders>>> getOrders();
}
