import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'store_controller.dart';
import 'waiting_screen.dart';
import 'kitchen_screen.dart';
import 'serving_screen.dart';
import 'status_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';



Future main() async{
  await dotenv.load(fileName: ".env");

  Get.put(StoreController());
  Get.put(RefreshController());

  runApp(const MyApp());
  }


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //헤더 부분 UI
    return GetMaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: const Color(0xFFF5F5F5),
          appBar: AppBar(
            title: const Padding(
              // 로고 부분 UI
              padding: EdgeInsets.symmetric(horizontal: 0.0),
              child: SizedBox(
                width: 100,
                height: 24,
                child: Row(
                  children: [
                    Text(
                      '소프트런치',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(width: 4),
                    // 로그인 소셜 계정 아이콘
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Placeholder(),
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.white,
            // 탭바 UI
            bottom: const TabBar(
                tabs: [
                  Tab(text: '대기'),
                  Tab(text: '주방'),
                  Tab(text: '서빙'),
                  Tab(text: '현황')
                ],
                indicatorColor: Color(0xFFFF662B),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Color(0xFFFF662B),
                unselectedLabelColor: Color(0xFF989898),
                splashFactory: NoSplash.splashFactory),
            // 새로 고침 버튼
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Container(
                  width: 85,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: TextButton(
                    onPressed:(){
                      Get.find<RefreshController>().refresh();
                    },
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w700),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('새로고침'),
                  ),
                ),
              ),
            ],
          ),
          body: const TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                WaitingScreen(),
                KitchenScreen(),
                ServingScreen(),
                StatusScreen()
              ]),
        ),
      ),
    );
  }
}
