import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class StoreController extends GetxController {
  final token =  ''.obs;
  final storeSeq = 0.obs;
  final date = ''.obs;


  // 초기화 작업
  @override
  void onInit() {
    super.onInit();
    token.value = 'Bearer ${dotenv.env['API_AUTH_TOKEN']}';
    date.value = '20240828';
    storeSeq.value = 16;
  }
}

class RefreshController extends GetxController {
  @override
  void refresh() {
    update();
  }
}
