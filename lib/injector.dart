import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:testing/data/datasources/remote/order_api_services.dart';
import 'package:testing/data/repositories/order_repository_impl.dart';
import 'package:testing/domain/repositories/orderrepository.dart';
import 'package:testing/domain/usecases/get_orders.dart';
import 'package:testing/presentation/bloc/orders_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Dependencies
  injector.registerSingleton<OrderApiService>(OrderApiService(injector()));
  injector
      .registerSingleton<OrdersRepository>(OrdersRepositoryImpl(injector()));

  // UseCases
  injector.registerSingleton<GetOrdersUseCase>(GetOrdersUseCase(injector()));

  // Blocs
  injector.registerFactory<OrdersBloc>(() => OrdersBloc(injector()));
}
