import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

void toastExample(){
  Fluttertoast.showToast(
    msg: "새로고침 되었습니다.",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0),
            child: SizedBox(
              width: 100,
              height: 24,
              // alignment: Alignment.center,\
              child: Row(
                children: [
                  Text(
                    '소프트런치',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(width: 4),
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Placeholder(),
                  ),
                  // SizedBox(width: 4)
                ],
              ),
          ),
        ),
        backgroundColor: Colors.white,
        //새로 고침 버튼
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
                onPressed: toastExample,
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 14),
                  foregroundColor: Colors.white,

                ),
                child: const Text('새로고침'),
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}