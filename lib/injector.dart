import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:testing/data/datasources/remote/order_api_services.dart';
import 'package:testing/data/datasources/remote/orders_api_services.dart';
import 'package:testing/data/repositories/order_repository_impl.dart';
import 'package:testing/data/repositories/orders_repository_impl.dart';
import 'package:testing/domain/repositories/order_repository.dart';
import 'package:testing/domain/repositories/orders_repository.dart';
import 'package:testing/domain/usecases/get_detail_order.dart';
import 'package:testing/domain/usecases/get_orders.dart';
import 'package:testing/presentation/order/bloc/order_bloc.dart';
import 'package:testing/presentation/orders/bloc/orders_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Dependencies
  injector.registerSingleton<OrdersApiService>(OrdersApiService(injector()));
  injector
      .registerSingleton<OrdersRepository>(OrdersRepositoryImpl(injector()));
  injector.registerSingleton<OrderApiService>(OrderApiService(injector()));
  injector.registerSingleton<OrderRepository>(OrderRepositoryImpl(injector()));

  // UseCases
  injector.registerSingleton<GetOrdersUseCase>(GetOrdersUseCase(injector()));
  injector.registerSingleton<GetDetailOrderUseCase>(
      GetDetailOrderUseCase(injector()));

  // Blocs
  injector.registerFactory<OrdersBloc>(() => OrdersBloc(injector()));
  injector.registerFactory<OrderBloc>(() => OrderBloc(injector()));
}
