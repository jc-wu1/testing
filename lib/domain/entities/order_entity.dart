import 'package:equatable/equatable.dart';

class Orders extends Equatable {
  final int orderid;
  final String ordernumber;
  final String orderstate;
  final int total;
  final String orderdate;
  final int orderqty;
  final String orderpartnername;
  final String orderpartnerstate;
  final String ordersalesperson;
  final String link;

  const Orders({
    required this.orderid,
    required this.ordernumber,
    required this.orderstate,
    required this.total,
    required this.orderdate,
    required this.orderqty,
    required this.orderpartnername,
    required this.orderpartnerstate,
    required this.ordersalesperson,
    required this.link,
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
      link,
    ];
  }

  @override
  bool? get stringify => true;
}
