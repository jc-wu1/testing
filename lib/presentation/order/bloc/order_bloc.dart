import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testing/core/order_detail_params.dart';
import 'package:testing/core/resources.dart';
import 'package:testing/domain/entities/order_entity.dart';
import 'package:testing/domain/usecases/get_detail_order.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc(this.getDetailOrderUseCase) : super(OrderInitial()) {
    on<OrderFetched>(_onDetailFetched);
  }

  final GetDetailOrderUseCase getDetailOrderUseCase;

  void _onDetailFetched(OrderFetched event, Emitter<OrderState> emit) async {
    emit(OrderLoading());
    try {
      final dataState = await getDetailOrderUseCase.call(
        params: OrderDetailParams(
          orderid: event.orderId,
        ),
      );
      if (dataState is DataSuccess) {
        final order = dataState.data;
        emit(OrderLoaded(order!));
      } else {
        emit(OrderLoadError());
      }
    } catch (e) {
      emit(OrderLoadError());
    }
  }
}
