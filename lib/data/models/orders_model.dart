import 'package:testing/domain/entities/orders_entity.dart';

class OrdersModel extends OrdersEntity {
  const OrdersModel(
    int orderid,
    String ordernumber,
    String orderstate,
    int total,
    String orderdate,
    int orderqty,
    String orderpartnername,
    String orderpartnerstate,
    String ordersalesperson,
  ) : super(
          orderid: orderid,
          ordernumber: ordernumber,
          orderstate: orderstate,
          total: total,
          orderdate: orderdate,
          orderqty: orderqty,
          orderpartnername: orderpartnername,
          orderpartnerstate: orderpartnerstate,
          ordersalesperson: ordersalesperson,
        );

  factory OrdersModel.fromJson(Map<String, dynamic> map) {
    return OrdersModel(
      map["orderid"] as int,
      map["ordernumber"] as String,
      map["orderstate"] as String,
      map["total"] as int,
      map["orderdate"] as String,
      map["orderqty"] as int,
      map["orderpartnername"] as String,
      map["orderpartnerstate"] as String,
      map["ordersalesperson"] as String,
    );
  }
}
