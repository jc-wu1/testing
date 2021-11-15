import 'package:testing/core/noparams.dart';
import 'package:testing/core/resources.dart';
import 'package:testing/core/usecases.dart';
import 'package:testing/domain/entities/order_entity.dart';
import 'package:testing/domain/repositories/orderrepository.dart';

class GetOrdersUseCase implements UseCase<DataState<List<Orders>>, NoParams> {
  final OrdersRepository repository;

  GetOrdersUseCase(this.repository);

  @override
  Future<DataState<List<Orders>>> call({NoParams? params}) {
    return repository.getOrders();
  }
}
