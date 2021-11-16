import 'package:testing/data/models/order_lines_model.dart';
import 'package:testing/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required int orderid,
    required String ordernumber,
    required String orderstatus,
    required String orderpartnername,
    required String orderdate,
    required String orderwarehouse,
    required String ordersalesperson,
    required String orderinvoicename,
    required String orderinvoicestreet,
    required String orderinvoicecity,
    required String orderinvoicestate,
    required String orderinvoicecountry,
    required String ordershippingname,
    required String ordershippingaddress,
    required String ordershippingcity,
    required String ordershippingstate,
    required String ordershippingcountry,
    required String ordernotes,
    required int ordertotalqty,
    required String orderamounttotal,
    required List<OrderLinesModel> orderlines,
  }) : super(
          orderid: orderid,
          ordernumber: ordernumber,
          orderstatus: orderstatus,
          orderpartnername: orderpartnername,
          orderdate: orderdate,
          orderwarehouse: orderwarehouse,
          ordersalesperson: ordersalesperson,
          orderinvoicename: orderinvoicename,
          orderinvoicestreet: orderinvoicestreet,
          orderinvoicecity: orderinvoicecity,
          orderinvoicestate: orderinvoicestate,
          orderinvoicecountry: orderinvoicecountry,
          ordershippingname: ordershippingname,
          ordershippingaddress: ordershippingaddress,
          ordershippingcity: ordershippingcity,
          ordershippingstate: ordershippingstate,
          ordershippingcountry: ordershippingcountry,
          ordernotes: ordernotes,
          ordertotalqty: ordertotalqty,
          orderamounttotal: orderamounttotal,
          orderlines: orderlines,
        );

  factory OrderModel.fromJson(Map<String, dynamic> map) {
    return OrderModel(
      orderid: map["orderid"] as int,
      ordernumber: map["ordernumber"] as String,
      orderstatus: map["orderstatus"] as String,
      orderpartnername: map["orderpartnername"] as String,
      orderdate: map["orderdate"] as String,
      orderwarehouse: map["orderwarehouse"] as String,
      ordersalesperson: map["ordersalesperson"] as String,
      orderinvoicename: map["orderinvoicename"] as String,
      orderinvoicestreet: map["orderinvoicestreet"] as String,
      orderinvoicecity: map["orderinvoicecity"] as String,
      orderinvoicestate: map["orderinvoicestate"] as String,
      orderinvoicecountry: map["orderinvoicecountry"] as String,
      ordershippingname: map["ordershippingname"] as String,
      ordershippingaddress: map["ordershippingaddress"] as String,
      ordershippingcity: map["ordershippingcity"] as String,
      ordershippingstate: map["ordershippingstate"] as String,
      ordershippingcountry: map["ordershippingcountry"] as String,
      ordernotes: map["ordernote"] as String,
      ordertotalqty: map["ordertotalqty"] as int,
      orderamounttotal: map["orderamounttotal"] as String,
      orderlines: (map["orderlines"] as List<dynamic>)
          .map((e) => OrderLinesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
