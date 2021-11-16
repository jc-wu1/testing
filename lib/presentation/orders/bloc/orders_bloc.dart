import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testing/core/resources.dart';
import 'package:testing/domain/entities/orders_entity.dart';
import 'package:testing/domain/usecases/get_orders.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc(this._getOrdersUseCase) : super(OrdersInitial()) {
    on<OrdersFetched>(_onOrderFetched);
  }

  final GetOrdersUseCase _getOrdersUseCase;

  void _onOrderFetched(OrdersFetched event, Emitter<OrdersState> emit) async {
    emit(OrdersLoading());
    try {
      final dataState = await _getOrdersUseCase.call();
      if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
        final orders = dataState.data;
        emit(OrdersLoaded(orders!));
      } else {
        emit(OrdersError());
      }
    } catch (e) {
      emit(OrdersError());
    }
  }
}
