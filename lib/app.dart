import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/injector.dart';
import 'package:testing/presentation/order/view/order_detail_page.dart';
import 'package:testing/presentation/orders/bloc/orders_bloc.dart';
import 'package:testing/presentation/orders/view/orders_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrdersBloc>(
      create: (_) => injector()..add(OrdersFetched()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const OrdersPage(),
          '/orderdetail': (_) => const OrderDetailPage(),
        },
      ),
    );

    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider<OrderBloc>(
    //       create: (_) => injector(),
    //     ),
    //     BlocProvider<OrdersBloc>(
    //       create: (_) => injector()..add(OrdersFetched()),
    //     ),
    //   ],
    //   child: MaterialApp(
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     initialRoute: '/',
    //     routes: {
    //       '/': (_) => const OrdersPage(),
    //       '/orderdetail': (_) => const OrderDetailPage(),
    //     },
    //   ),
    // );
  }
}
