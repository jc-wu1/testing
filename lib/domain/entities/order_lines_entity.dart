import 'package:equatable/equatable.dart';

class OrderLinesEntity extends Equatable {
  final int productId;
  final int productTmplId;
  final String name;
  final int priceTotal;
  final int priceUnit;
  final int productUOMQty;
  final int qtyDelivered;
  final String imgUrl;

  const OrderLinesEntity({
    required this.productId,
    required this.productTmplId,
    required this.name,
    required this.priceTotal,
    required this.priceUnit,
    required this.productUOMQty,
    required this.qtyDelivered,
    required this.imgUrl,
  });

  @override
  List<Object?> get props => [];
}
