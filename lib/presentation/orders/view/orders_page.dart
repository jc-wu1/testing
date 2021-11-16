import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/presentation/order/order_page_args.dart';
import 'package:testing/presentation/orders/bloc/orders_bloc.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
          if (state is OrdersLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is OrdersLoaded) {
            return ListView.builder(
              itemCount: state.orders.length,
              itemBuilder: (BuildContext context, int index) {
                final order = state.orders[index];
                return ListTile(
                  title: Text(order.ordernumber),
                  subtitle: Text(order.orderpartnername),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      '/orderdetail',
                      arguments: OrderPageArguments(
                        orders: state.orders,
                        length: state.orders.length,
                        pageIndex: index,
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(child: Text("error"));
          }
        },
      ),
    );
  }
}
