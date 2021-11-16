import 'package:equatable/equatable.dart';

class OrdersEntity extends Equatable {
  final int orderid;
  final String ordernumber;
  final String orderstate;
  final int total;
  final String orderdate;
  final int orderqty;
  final String orderpartnername;
  final String orderpartnerstate;
  final String ordersalesperson;

  const OrdersEntity({
    required this.orderid,
    required this.ordernumber,
    required this.orderstate,
    required this.total,
    required this.orderdate,
    required this.orderqty,
    required this.orderpartnername,
    required this.orderpartnerstate,
    required this.ordersalesperson,
  });

  @override
  List<Object?> get props {
    return [
      orderid,
      ordernumber,
      orderstate,
      total,
      orderdate,
      orderqty,
      orderpartnername,
      orderpartnerstate,
      ordersalesperson,
    ];
  }

  @override
  bool? get stringify => true;
}
