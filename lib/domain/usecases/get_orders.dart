import 'package:testing/core/no_params.dart';
import 'package:testing/core/resources.dart';
import 'package:testing/core/usecases.dart';
import 'package:testing/domain/entities/orders_entity.dart';
import 'package:testing/domain/repositories/orders_repository.dart';

class GetOrdersUseCase
    implements UseCase<DataState<List<OrdersEntity>>, NoParams> {
  final OrdersRepository repository;

  GetOrdersUseCase(this.repository);

  @override
  Future<DataState<List<OrdersEntity>>> call({NoParams? params}) {
    return repository.getOrders();
  }
}
