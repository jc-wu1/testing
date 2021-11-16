import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testing/domain/entities/order_entity.dart';
import 'package:testing/injector.dart';
import 'package:testing/presentation/order/bloc/order_bloc.dart';
import 'package:testing/presentation/order/order_page_args.dart';
import 'package:testing/presentation/widgets/widget_spacer.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as OrderPageArguments;

    final PageController _controller =
        PageController(initialPage: args.pageIndex);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Sales Order',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: PageView.builder(
        itemCount: args.length,
        controller: _controller,
        itemBuilder: (_, index) {
          return BlocProvider<OrderBloc>.value(
            value: injector()..add(OrderFetched(args.orders[index].orderid)),
            child: const OrderDetail(),
          );
        },
      ),
    );
  }
}

class OrderDetail extends StatefulWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state is OrderLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is OrderLoaded) {
          var order = state.order;
          return OrderDetailBody(
            order: order,
          );
        } else {
          return const Center(child: Text("error"));
        }
      },
    );
  }
}

class OrderDetailBody extends StatelessWidget {
  const OrderDetailBody({Key? key, required this.order}) : super(key: key);

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _DetailHeader(order: order),
                  Container(
                    height: 10,
                    width: double.infinity,
                    color: Colors.grey[200],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            leading: SizedBox(
                              width: 36,
                              height: 36,
                              child: SvgPicture.asset(
                                'assets/icons/bill.svg',
                                height: 36,
                                width: 36,
                                color: Colors.black,
                              ),
                            ),
                            title: Text(
                              "Invoice Address:\n${order.orderinvoicename}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              "${order.orderinvoicestreet}\n${order.orderinvoicecity}, ${order.orderinvoicestate}, ${order.orderinvoicecountry}",
                            ),
                            // subtitle: Text(
                            // '${widget.order.orderInvoiceAddress1}\n${widget.order.orderInvoiceCity}, ${widget.order.orderInvoiceState}, ${widget.order.orderInvoiceCountry}'),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            leading: SizedBox(
                              width: 36,
                              height: 36,
                              child: SvgPicture.asset(
                                'assets/icons/delivery.svg',
                                height: 36,
                                width: 36,
                                color: Colors.black,
                              ),
                            ),
                            title: Text(
                              "Delivery Address:\n${order.ordershippingname}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // title: Text(
                            //   TranslationConstants.deliveryAddress.t(context) +
                            //       ':\n${widget.order.orderDeliveryContactName}',
                            //   style: TextStyle(fontWeight: FontWeight.bold),
                            // ),
                            subtitle: Text(
                              '${order.ordershippingaddress}\n${order.ordershippingcity}, ${order.ordershippingstate}, ${order.ordershippingcountry}',
                            ),
                            // subtitle: Text(
                            // '${widget.order.orderDeliveryAddress1}\n${widget.order.orderDeliveryCity}, ${widget.order.orderDeliveryState}, ${widget.order.orderDeliveryCountry}'),
                          ),
                        ),
                        // order.orderstatus.toLowerCase() == 'process'
                        //     ? _SCStatusWidget(order: order)
                        //     : Container(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Column(
                      children: [
                        // _OrderNote(noteFieldController: _noteFieldController),
                        WidgetSpacer(
                          height: 10,
                        ),
                        // Card(
                        //   shape: RoundedRectangleBorder(
                        //     side: BorderSide(color: Colors.grey[200]!),
                        //     borderRadius: BorderRadius.circular(15.0),
                        //   ),
                        //   elevation: 0.0,
                        //   shadowColor: Colors.black,
                        //   clipBehavior: Clip.antiAlias,
                        //   child: Container(
                        //     child: ListTile(
                        //       onTap: () {
                        //         // Navigator.of(context).pushNamed(
                        //         //   AppRouter.deliveryOrderList,
                        //         //   arguments: widget.order.orderId,
                        //         // );
                        //       },
                        //       leading: SvgPicture.asset(
                        //         'assets/icons/ic_delivery_order.svg',
                        //         height: 24,
                        //         width: 24,
                        //         color: Colors.black,
                        //       ),
                        //       title: Text(TranslationConstants.deliveryOrder
                        //           .t(context)),
                        //       trailing: Row(
                        //         mainAxisSize: MainAxisSize.min,
                        //         children: [
                        //           Badge(
                        //             badgeColor: ColorConst.colorBLACK2,
                        //             toAnimate: false,
                        //             badgeContent: Text(
                        //               widget.order.orderDOCount.toString(),
                        //               style: TextStyle(
                        //                 color: Colors.white,
                        //               ),
                        //             ),
                        //           ),
                        //           Icon(Icons.arrow_forward_ios),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // WidgetSpacer(
                        //   height: 10,
                        // ),
                        // Card(
                        //   shape: RoundedRectangleBorder(
                        //     side: BorderSide(color: ColorConst.colorGRAY7),
                        //     borderRadius: BorderRadius.circular(15.0),
                        //   ),
                        //   elevation: 0.0,
                        //   shadowColor: Colors.black,
                        //   clipBehavior: Clip.antiAlias,
                        //   child: Container(
                        //     child: ListTile(
                        //       onTap: () {
                        //         Navigator.of(context).pushNamed(
                        //           AppRouter.siListBySO,
                        //           arguments: widget.order.orderId,
                        //         );
                        //       },
                        //       leading: MySvgImage(
                        //         path: 'assets/icons/ic_bill.svg',
                        //         height: 24,
                        //         width: 24,
                        //         color: Colors.black,
                        //       ),
                        //       title:
                        //           Text(TranslationConstants.invoice.t(context)),
                        //       trailing: Row(
                        //         mainAxisSize: MainAxisSize.min,
                        //         children: [
                        //           Badge(
                        //             badgeColor: ColorConst.colorBLACK2,
                        //             toAnimate: false,
                        //             badgeContent: Text(
                        //               widget.order.orderSICount.toString(),
                        //               style: TextStyle(
                        //                 color: Colors.white,
                        //               ),
                        //             ),
                        //           ),
                        //           Icon(Icons.arrow_forward_ios),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        WidgetSpacer(
                          height: 10,
                        ),
                        _ItemListWidget(
                          // scrollController: _scrollController,
                          order: order,
                        ),
                      ],
                    ),
                  ),
                  WidgetSpacer(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: Column(
                      children: [
                        if (order.orderstatus.toLowerCase() == 'open')
                          Card(
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 2.0,
                            shadowColor: Colors.black,
                            clipBehavior: Clip.antiAlias,
                            child: InkWell(
                              onTap: () {
                                // int orderid = widget.order.orderId;
                                // showOkCancelAlertDialog(
                                //   context: context,
                                //   title: 'Cancel order',
                                //   message: TranslationConstants.msgCancel
                                //       .t(context),
                                //   barrierDismissible: false,
                                //   defaultType:
                                //       OkCancelAlertDefaultType.cancel,
                                // ).then((value) {
                                //   if (value == OkCancelResult.ok) {
                                //     _onTapButtonCancel(orderid, context);
                                //   }
                                // });
                              },
                              child: const ListTile(
                                leading: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                                title: Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.white),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        else if (order.orderstatus.toLowerCase() == 'cancel')
                          Column(
                            children: [
                              Card(
                                color: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 2.0,
                                shadowColor: Colors.black,
                                clipBehavior: Clip.antiAlias,
                                child: ListTile(
                                  onTap: () {
                                    // int orderid = widget.order.orderId;
                                    // showOkCancelAlertDialog(
                                    //   context: context,
                                    //   title: TranslationConstants
                                    //       .modifyThisOrder
                                    //       .t(context),
                                    //   message: TranslationConstants
                                    //       .msgModifyOrder
                                    //       .t(context),
                                    //   barrierDismissible: false,
                                    //   defaultType:
                                    //       OkCancelAlertDefaultType.cancel,
                                    // ).then((value) {
                                    //   if (value == OkCancelResult.ok) {
                                    //     _onTapButtonModify(orderid);
                                    //   }
                                    // });
                                  },
                                  leading: const Icon(
                                    Icons.note,
                                    color: Colors.white,
                                  ),
                                  title: const Text(
                                    "Modify",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Card(
                                color: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 2.0,
                                shadowColor: Colors.black,
                                clipBehavior: Clip.antiAlias,
                                child: InkWell(
                                  onTap: () {
                                    // int orderid = widget.order.orderId;
                                    // showOkCancelAlertDialog(
                                    //   context: context,
                                    //   title: 'Delete Order',
                                    //   message: TranslationConstants.msgDelete
                                    //       .t(context),
                                    //   barrierDismissible: false,
                                    //   defaultType:
                                    //       OkCancelAlertDefaultType.cancel,
                                    // ).then((value) {
                                    //   if (value == OkCancelResult.ok) {
                                    //     _onTapButtonDelete(orderid);
                                    //   }
                                    // });
                                  },
                                  child: const ListTile(
                                    leading: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                    title: Text(
                                      "Delete",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        else
                          Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: Colors.grey[200]!)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${order.ordertotalqty} item(s)',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              // Text(
              //   'Total: ' +
              //       NumberFormat.currency(
              //         locale: 'id',
              //         symbol: 'Rp ',
              //         decimalDigits: 0,
              //       ).format(order.orderamounttotal),
              //   style: const TextStyle(fontWeight: FontWeight.bold),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ItemListWidget extends StatelessWidget {
  const _ItemListWidget({
    Key? key,
    required this.order,
  }) : super(key: key);

  final OrderEntity order;

  // void _showItemDetails(BuildContext context, OrderLines item) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(32.0))),
  //         contentPadding: EdgeInsets.only(top: 30.0),
  //         content: Container(
  //           width: 300,
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.stretch,
  //             mainAxisSize: MainAxisSize.min,
  //             children: <Widget>[
  //               GestureDetector(
  //                 onTap: () {
  //                   var args = new ScreenArguments(
  //                     item.lineProductName!,
  //                     item.lineProductImage!,
  //                   );
  //                   Navigator.of(context).pushNamed(
  //                     AppRouter.imageView,
  //                     arguments: args,
  //                   );
  //                   // pushNewScreen(
  //                   //   context,
  //                   //   screen: ImageViewerScreen(
  //                   //     imageTitle: item.lineProductName!,
  //                   //     imageUrl: item.lineProductImage!,
  //                   //   ),
  //                   // );
  //                 },
  //                 child: Container(
  //                   padding: EdgeInsets.only(left: 30.0, right: 30.0),
  //                   child: Image.network(
  //                     item.lineProductImage!,
  //                     errorBuilder: (
  //                       BuildContext context,
  //                       Object exception,
  //                       StackTrace? stackTrace,
  //                     ) {
  //                       return Image.asset(
  //                         'assets/images/placeholder-image.png',
  //                         color: Colors.white,
  //                         // fit: BoxFit.cover,
  //                         width: 60,
  //                         height: 60,
  //                       );
  //                     },
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: 10.0,
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Text(
  //                       '${item.lineProductName}',
  //                       style: TextStyle(fontWeight: FontWeight.bold),
  //                     ),
  //                     SizedBox(
  //                       height: 10.0,
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Text(TranslationConstants.unitPrice.t(context)),
  //                         Text(NumberFormat.currency(
  //                                 locale: 'id',
  //                                 symbol: 'Rp ',
  //                                 name: 'IDR',
  //                                 decimalDigits: 0)
  //                             .format(item.linePriceUnit))
  //                       ],
  //                     ),
  //                     SizedBox(
  //                       height: 10.0,
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Text('${TranslationConstants.quantity.t(context)} :'),
  //                         Text('${item.lineOrderQty!.toInt()} dus')
  //                       ],
  //                     ),
  //                     SizedBox(
  //                       height: 10.0,
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Text('${TranslationConstants.freeQty.t(context)} :'),
  //                         Text('${item.lineFreeQty!.toInt()} dus')
  //                       ],
  //                     ),
  //                     SizedBox(
  //                       height: 10.0,
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Text('Total Qty :'),
  //                         Text(
  //                             '${item.lineOrderQty!.toInt() + item.lineFreeQty!.toInt()} dus')
  //                       ],
  //                     ),
  //                     SizedBox(
  //                       height: 10.0,
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Text(
  //                             '${TranslationConstants.deliveredQty.t(context)} :'),
  //                         Text('${item.lineDeliveredQty!.toInt()} dus')
  //                       ],
  //                     ),
  //                     SizedBox(
  //                       height: 10.0,
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Text('Subtotal :'),
  //                         Text(NumberFormat.currency(
  //                                 locale: 'id',
  //                                 symbol: 'Rp ',
  //                                 name: 'IDR',
  //                                 decimalDigits: 0)
  //                             .format(item.lineSubTotal))
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               InkWell(
  //                 onTap: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: Container(
  //                   padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
  //                   decoration: BoxDecoration(
  //                     color: Colors.blue,
  //                     borderRadius: BorderRadius.only(
  //                         bottomLeft: Radius.circular(32.0),
  //                         bottomRight: Radius.circular(32.0)),
  //                   ),
  //                   child: Text(
  //                     "OK",
  //                     style: TextStyle(color: Colors.white),
  //                     textAlign: TextAlign.center,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 0.0,
      shadowColor: Colors.black,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            color: Colors.white10,
            child: const ListTile(
              leading: Icon(Icons.notes),
              title: Text('Order detail'),
            ),
          ),
          Scrollbar(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: order.orderlines.length,
              itemBuilder: (BuildContext context, int index) {
                var item = order.orderlines[index];
                return ListTile(
                  onTap: () {
                    // showItemDetails(context, item);
                    // _showItemDetails(context, item);
                  },
                  contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        item.imgUrl,
                        fit: BoxFit.cover,
                        width: 60,
                        height: 60,
                        errorBuilder: (
                          BuildContext context,
                          Object exception,
                          StackTrace? stackTrace,
                        ) {
                          return Image.asset(
                            'assets/images/placeholder-image.png',
                            color: Colors.white,
                            fit: BoxFit.cover,
                            width: 60,
                            height: 60,
                          );
                        },
                      ),
                    ),
                  ),
                  title: SizedBox(
                    width: 150,
                    child: Text(
                      item.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Rp. 10.000"),
                      // Row(
                      //   children: <Widget>[
                      //     item.lineFreeQty != 0.0
                      //         ? Badge(
                      //             padding: EdgeInsets.fromLTRB(7, 1, 7, 1),
                      //             toAnimate: false,
                      //             shape: BadgeShape.square,
                      //             badgeColor: Colors.blue,
                      //             borderRadius: BorderRadius.circular(20),
                      //             badgeContent: Text('Free Qty',
                      //                 style: TextStyle(color: Colors.white)),
                      //           )
                      //         : Text(''),
                      //   ],
                      // )
                    ],
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('${item.productUOMQty.toInt()} dus'),
                      Text(
                        '\u{1F69A} ${item.qtyDelivered.toInt()} dus',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailHeader extends StatelessWidget {
  const _DetailHeader({
    Key? key,
    required this.order,
  }) : super(key: key);

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    order.ordernumber,
                    style: const TextStyle(
                      color: Color.fromRGBO(68, 68, 68, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  order.orderstatus == 'open'
                      ? IconButton(
                          onPressed: () {
                            // _launchURL();
                            // BlocProvider.of<OrderDetailBloc>(context).add(
                            //   SendWhatsappPressed(
                            //     orderid: order.orderId,
                            //   ),
                            // );
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/ic_whatsapp.svg',
                            width: 24,
                            height: 24,
                          ),
                        )
                      : Container(),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: order.orderstatus.toLowerCase() == 'done'
                        ? Colors.greenAccent
                        : order.orderstatus.toLowerCase() == 'process'
                            ? Colors.orangeAccent
                            : order.orderstatus.toLowerCase().contains('cancel')
                                ? Colors.grey[200]
                                : Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    order.orderstatus,
                    style: const TextStyle(
                      color: Colors.white,
                      // fontSize: 13,
                    ),
                  ),
                ),
              ),
              // Chip(
              // label: Text(
              //   '${toBeginningOfSentenceCase(order.orderStatus)}',
              //   style: TextStyle(
              //     color: Colors.white),
              //   ),
              //   backgroundColor:
              // order.orderStatus!.toLowerCase() == 'done'
              //     ? Colors.greenAccent
              //     : order.orderStatus!.toLowerCase() == 'process'
              //         ? Colors.orangeAccent
              //         : order.orderStatus!
              //                 .toLowerCase()
              //                 .contains('cancel')
              //             ? ColorConst.colorGRAY60
              //             : Colors.blueAccent,
              // ),
            ],
          ),
          WidgetSpacer(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Customer",
                style: TextStyle(
                  color: Colors.blueAccent,
                  // fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                width: 250,
                child: Text(
                  order.orderpartnername,
                  textAlign: TextAlign.end,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Color.fromRGBO(68, 68, 68, 1),
                  ),
                ),
              ),
            ],
          ),
          WidgetSpacer(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Order date",
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
              Text(
                order.orderdate,
                style: const TextStyle(
                  color: Color.fromRGBO(68, 68, 68, 1),
                ),
              ),
            ],
          ),
          WidgetSpacer(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Warehouse',
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
              Text(
                order.orderwarehouse,
                style: const TextStyle(
                  color: Color.fromRGBO(68, 68, 68, 1),
                ),
              ),
            ],
          ),
          WidgetSpacer(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Sales person',
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
              Text(
                order.ordersalesperson,
                style: const TextStyle(
                  color: Color.fromRGBO(68, 68, 68, 1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
