import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ModalBottomSheet',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ModalBottomSheet Height Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => showDefaultHeightModalBottomSheet(context),
              child: const Text('높이를 따로 설정하지 않음'),
            ),
            TextButton(
              onPressed: () => showShortHeightModalBottomSheet(context),
              child: const Text('기본 높이보다 짧은 높이'),
            ),
            TextButton(
              onPressed: () => showLongHeightModalBottomSheet(context),
              child: const Text('기본 높이보다 긴 높이'),
            ),
          ],
        ),
      ),
    );
  }

  void showDefaultHeightModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: ElevatedButton(
            child: const Text('ModalBottomSheet 닫기'),
            onPressed: () => Navigator.pop(context),
          ),
        );
      },
    );
  }

  void showShortHeightModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          // SizedBox로 감싸고 height로 높이를 지정.
          height: 200,
          child: Center(
            child: ElevatedButton(
              child: const Text('ModalBottomSheet 닫기'),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        );
      },
    );
  }

  void showLongHeightModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      // isScrollControlled를 true로 설정.
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Center(
            child: ElevatedButton(
              child: const Text('ModalBottomSheet 닫기'),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        );
      },
    );
  }
}
