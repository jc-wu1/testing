import 'package:testing/domain/entities/orders_entity.dart';

class OrderPageArguments {
  final List<OrdersEntity> orders;
  final int length;
  final int pageIndex;

  OrderPageArguments({
    required this.orders,
    required this.length,
    required this.pageIndex,
  });
}
