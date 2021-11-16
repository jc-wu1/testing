import 'package:testing/domain/entities/order_lines_entity.dart';

class OrderLinesModel extends OrderLinesEntity {
  const OrderLinesModel({
    required int productId,
    required int productTmplId,
    required String name,
    required int priceTotal,
    required int priceUnit,
    required int productUOMQty,
    required int qtyDelivered,
    required String imgUrl,
  }) : super(
          productId: productId,
          productTmplId: productTmplId,
          name: name,
          priceTotal: priceTotal,
          priceUnit: priceUnit,
          productUOMQty: productUOMQty,
          qtyDelivered: qtyDelivered,
          imgUrl: imgUrl,
        );

  factory OrderLinesModel.fromJson(Map<String, dynamic> json) {
    return OrderLinesModel(
      productId: json["product_id"] as int,
      productTmplId: json["product_tmpl_id"] as int,
      name: json["name"] as String,
      priceTotal: json["price_total"] as int,
      priceUnit: json["price_unit"] as int,
      productUOMQty: json["product_uom_qty"] as int,
      qtyDelivered: json["qty_delivered"] as int,
      imgUrl: json["imgurl"] as String,
    );
  }
}
