import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testing/core/resources.dart';
import 'package:testing/domain/entities/order_entity.dart';
import 'package:testing/domain/usecases/get_orders.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc(this._getOrdersUseCase) : super(OrdersInitial()) {
    on<OrderFetched>(_onOrderFetched);
  }

  final GetOrdersUseCase _getOrdersUseCase;

  Future<void> _onOrderFetched(
      OrderFetched event, Emitter<OrdersState> emit) async {
    try {
      final dataState = await _getOrdersUseCase.call();
      if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
        final orders = dataState.data;
        return emit(
          OrdersLoaded(orders!),
        );
      } else {
        return emit(OrdersError());
      }
    } catch (e) {
      return emit(OrdersError());
    }
  }
}
