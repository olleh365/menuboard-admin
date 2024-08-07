import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'grouped_tables_model.dart';
import 'order_model.dart';

part 'menu_network.g.dart';

@RestApi(baseUrl: "https://apidev.pocmenu.com/menuboard/api/admin/")
abstract class MenuNetwork {
  factory MenuNetwork(Dio dio, {String baseUrl}) = _MenuNetwork;


  @GET("/orders")
  Future<OrderResponse> getOrders(
      @Query("storeSeq") int storeSeq,
      @Query("date") String date,
      );

  @DELETE("/orders/{orderSeq}/{orderMenuSeq}")
  Future<void> deleteMenu(
      @Path("orderSeq") int orderSeq,
      @Path("orderMenuSeq") int orderMenuSeq,
      );

  @GET("orders/grouped-tables")
  Future<TableResponse> getOrderGroups(
      @Query("storeSeq") int storeSeq,
      @Query("date") String date,
      );

  @PUT("/orders/{orderSeq}/update-status")
  Future<void> updateMenu(
      @Path("orderSeq") int orderSeq,
      );
}
