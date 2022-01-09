import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Screen Orientation',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // 세로 정방향
      DeviceOrientation.portraitDown, // 세로 역방향
      DeviceOrientation.landscapeLeft, // 가로 왼쪽 방향
      DeviceOrientation.landscapeRight, // 가로 오른쪽 방향
    ]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fixing the Screen Orientation Example'),
      ),
      body: const Center(
        child: FlutterLogo(size: 150),
      ),
    );
  }
}
