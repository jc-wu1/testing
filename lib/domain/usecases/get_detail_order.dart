import 'package:testing/core/order_detail_params.dart';
import 'package:testing/core/resources.dart';
import 'package:testing/core/usecases.dart';
import 'package:testing/domain/entities/order_entity.dart';
import 'package:testing/domain/repositories/order_repository.dart';

class GetDetailOrderUseCase
    implements UseCase<DataState<OrderEntity>, OrderDetailParams> {
  final OrderRepository repository;

  GetDetailOrderUseCase(this.repository);

  @override
  Future<DataState<OrderEntity>> call({required OrderDetailParams params}) {
    return repository.getOrder(params);
  }
}
