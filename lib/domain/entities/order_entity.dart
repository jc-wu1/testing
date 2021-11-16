import 'package:equatable/equatable.dart';
import 'package:testing/domain/entities/order_lines_entity.dart';

class OrderEntity extends Equatable {
  final int orderid;
  final String ordernumber;
  final String orderstatus;
  final String orderpartnername;
  final String orderdate;
  final String orderwarehouse;
  final String ordersalesperson;
  final String orderinvoicename;
  final String orderinvoicestreet;
  final String orderinvoicecity;
  final String orderinvoicestate;
  final String orderinvoicecountry;
  final String ordershippingname;
  final String ordershippingaddress;
  final String ordershippingcity;
  final String ordershippingstate;
  final String ordershippingcountry;
  final String ordernotes;
  final int ordertotalqty;
  final String orderamounttotal;
  final List<OrderLinesEntity> orderlines;

  const OrderEntity({
    required this.orderid,
    required this.ordernumber,
    required this.orderstatus,
    required this.orderpartnername,
    required this.orderdate,
    required this.orderwarehouse,
    required this.ordersalesperson,
    required this.orderinvoicename,
    required this.orderinvoicestreet,
    required this.orderinvoicecity,
    required this.orderinvoicestate,
    required this.orderinvoicecountry,
    required this.ordershippingname,
    required this.ordershippingaddress,
    required this.ordershippingcity,
    required this.ordershippingstate,
    required this.ordershippingcountry,
    required this.ordernotes,
    required this.ordertotalqty,
    required this.orderamounttotal,
    required this.orderlines,
  });

  @override
  List<Object?> get props => [];
}
