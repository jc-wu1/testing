import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:testing/data/models/orders_response_model.dart';

part 'orders_api_services.g.dart';

@RestApi(baseUrl: 'http://10.1.10.11:3000/api/v1')
abstract class OrdersApiService {
  factory OrdersApiService(Dio dio, {String baseUrl}) = _OrdersApiService;

  static const Map<String, String> headerDataDev = {
   
  };

  @GET('/orders/test')
  @Headers(headerDataDev)
  Future<HttpResponse<OrderListResponseModel>> getOrders();
}
