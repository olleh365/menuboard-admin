import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:menuboard_admin/models/grouped_tables_model.dart';
import 'package:menuboard_admin/models/order_model.dart';
import '../auth_response.dart';

part 'menu_network.g.dart';

@RestApi(baseUrl: "https://apidev.pocmenu.com/menuboard/api/admin/")
abstract class MenuNetwork {
  factory MenuNetwork(Dio dio, {String baseUrl}) = _MenuNetwork;

  @POST("/auth/admin/sign")
  Future<AuthResponse> login(
      @Query("token") String token,
      @Query("uid") String uid,
      );

  @GET("/orders")
  Future<OrderResponse> getOrders(
      @Query("storeSeq") int storeSeq,
      @Query("date") String date,
      );

  @GET("/orders/grouped-tables")
  Future<TableResponse> getOrderGroups(
      @Query("storeSeq") int storeSeq,
      @Query("date") String date,
      );

  @GET("/orders/table-orders")
  Future<TableResponse> getTableOrders(
      @Query("tableNum") int tableNum,
      @Query("storeSeq") int storeSeq,
      @Query("date") String date,
      );

  @PUT("/orders/{orderSeq}/update-status")
  Future<void> updateMenu(
      @Path("orderSeq") int orderSeq,
      );

  @DELETE("/orders/{orderSeq}/{orderMenuSeq}")
  Future<void> deleteMenu(
      @Path("orderSeq") int orderSeq,
      @Path("orderMenuSeq") int orderMenuSeq,
      );
}

class TokenInterceptor extends Interceptor {
  final Dio dio;
  final String Function() getToken;
  final Future<void> Function() refreshToken;

  TokenInterceptor({
    required this.dio,
    required this.getToken,
    required this.refreshToken,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // 요청을 보내기 전에 토큰을 헤더에 추가
    final token = getToken();
    options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // 토큰이 만료된 경우 토큰 갱신을 시도
      try {
        await refreshToken();
        final token = getToken();
        final requestOptions = err.requestOptions;

        // 갱신된 토큰으로 원래 요청을 재시도
        final response = await dio.request(
          requestOptions.path,
          options: Options(
            method: requestOptions.method,
            headers: {'Authorization': 'Bearer $token'},
          ),
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
        );
        return handler.resolve(response);
      } catch (e) {
        // 토큰 갱신 실패 시 로그아웃 처리 등을 여기에 추가 가능
        return handler.reject(err);
      }
    }
    super.onError(err, handler);
  }
}