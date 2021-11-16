import 'package:testing/data/models/orders_model.dart';

class OrderListResponseModel {
  final String status;
  final String message;
  final List<OrdersModel> orders;

  OrderListResponseModel({
    required this.status,
    required this.message,
    required this.orders,
  });

  factory OrderListResponseModel.fromJson(Map<String, dynamic> json) {
    return OrderListResponseModel(
      status: json["status"] as String,
      message: json["message"] as String,
      orders: List<OrdersModel>.from(
        (json['result'] as List<dynamic>).map(
          (e) => OrdersModel.fromJson(e as Map<String, dynamic>),
        ),
      ),
    );
  }
}
