import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class StoreController extends GetxController {
  final token =  'Bearer ${dotenv.env['API_AUTH_TOKEN']}'.obs;
  final storeSeq = 16.obs;
  final date = DateTime.now().obs;

// Add any other necessary logic and properties for StoreState
}

class RefreshController extends GetxController {
  @override
  void refresh() {
    update();
  }
}
