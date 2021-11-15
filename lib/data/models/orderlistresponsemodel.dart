import 'package:testing/data/models/ordersmodel.dart';

class OrderListResponseModel {
  final String status;
  final String message;
  final List<OrderModel> orders;

  OrderListResponseModel({
    required this.status,
    required this.message,
    required this.orders,
  });

  factory OrderListResponseModel.fromJson(Map<String, dynamic> json) {
    return OrderListResponseModel(
      status: json["status"] as String,
      message: json["message"] as String,
      orders: List<OrderModel>.from(
        (json['result'] as List<dynamic>).map(
          (e) => OrderModel.fromJson(e as Map<String, dynamic>),
        ),
      ),
    );
  }
}
