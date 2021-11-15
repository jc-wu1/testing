import 'package:testing/domain/entities/order_entity.dart';

class OrderModel extends Orders {
  const OrderModel(
    int orderid,
    String ordernumber,
    String orderstate,
    int total,
    String orderdate,
    int orderqty,
    String orderpartnername,
    String orderpartnerstate,
    String ordersalesperson,
    String link,
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
          link: link,
        );

  factory OrderModel.fromJson(Map<String, dynamic> map) {
    return OrderModel(
      map["orderid"] as int,
      map["ordernumber"] as String,
      map["orderstate"] as String,
      map["total"] as int,
      map["orderdate"] as String,
      map["orderqty"] as int,
      map["orderpartnername"] as String,
      map["orderpartnerstate"] as String,
      map["ordersalesperson"] as String,
      map["link"] as String,
    );
  }
}
