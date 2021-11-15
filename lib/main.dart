import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/injector.dart';
import 'package:testing/presentation/bloc/orders_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrdersBloc>(
      create: (_) => injector()..add(OrderFetched()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
          if (state is OrdersLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is OrdersLoaded) {
            final orders = state.orders;
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (_, index) {
                final order = orders[index];
                return ListTile(
                  title: Text(order.ordernumber),
                  subtitle: Text(order.orderpartnername),
                  onTap: () {
                    log("Sasd");
                  },
                );
              },
            );
          } else {
            return const Text('error');
          }
        },
      ),
    );
  }
}
