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
      title: 'FittedBox',
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
        title: const Text('FittedBox Example'),
      ),
      body: ListView.separated(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return ItemFormat3(index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}

// 아무 설정도 하지 않음.
class ItemFormat1 extends StatelessWidget {
  const ItemFormat1(this.index, {Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Item$index'),
        Expanded(
          child: Container(
            height: 100,
            color: Colors.green,
          ),
        )
      ],
    );
  }
}

// 공간 크기만 지정.
class ItemFormat2 extends StatelessWidget {
  const ItemFormat2(this.index, {Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 40,
          child: Text('Item$index'),
        ),
        Expanded(
          child: Container(
            height: 100,
            color: Colors.yellow,
          ),
        )
      ],
    );
  }
}

// 공간 크기를 지정하고, FittedBox를 사용.
class ItemFormat3 extends StatelessWidget {
  const ItemFormat3(this.index, {Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 40,
          child: FittedBox(
            fit: BoxFit.fitWidth, // 가로 길이에 맞추도록 설정.
            child: Text('Item$index'),
          ),
        ),
        Expanded(
          child: Container(
            height: 100,
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}
