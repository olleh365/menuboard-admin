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
          title: const Text('소프트런치'),
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                    padding: const EdgeInsets.fromLTRB(10, 6, 8, 6),
                    textStyle: const TextStyle(fontSize: 14),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('새로고침'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}