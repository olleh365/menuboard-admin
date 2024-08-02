import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'order_model.dart';

part 'menu_network.g.dart';

@RestApi(baseUrl: "https://apidev.pocmenu.com/menuboard/api/admin/")
abstract class MenuNetwork {
  factory MenuNetwork(Dio dio, {String baseUrl}) = _MenuNetwork;

  @GET("orders/grouped-tables")
  Future<OrderResponse> getOrderGroups(
      @Query("storeSeq") int storeSeq,
      @Query("date") String date,
      );
}
