import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:testing/data/models/orderlistresponsemodel.dart';

part 'order_api_services.g.dart';

@RestApi(baseUrl: 'http://10.1.10.11:3000/api/v1')
abstract class OrderApiService {
  factory OrderApiService(Dio dio, {String baseUrl}) = _OrderApiService;

  static const Map<String, String> headerDataDev = {};

  @GET('/orders')
  @Headers(headerDataDev)
  Future<HttpResponse<OrderListResponseModel>> getOrders();
}
