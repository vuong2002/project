import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(//thêm hệ thống chrome và set kiểu lớp phủ giao diện 
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));//kiểu dáng và màu 
    return const MaterialApp(
      debugShowCheckedModeBanner: false,//loại bỏ văn bản gỡ lỗi bằng cách cấp sai cho biểu ngữ chế độ kiểm tra chương trình gỡ lỗi
      title: 'ToDo App',
      home: Home(),
    );
  }
}
