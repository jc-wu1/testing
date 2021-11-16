import 'package:testing/data/models/order_model.dart';

class OrderResponseModel {
  final String status;
  final String message;
  final OrderModel order;

  OrderResponseModel({
    required this.status,
    required this.message,
    required this.order,
  });

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) {
    return OrderResponseModel(
      status: json["status"] as String,
      message: json["message"] as String,
      order: OrderModel.fromJson(
        json["result"] as Map<String, dynamic>,
      ),
    );
  }
}
