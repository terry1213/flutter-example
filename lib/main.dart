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
      title: 'precacheImage',
      home: HomePage(),
    );
  }
}

// 처음 보이는 홈화면.
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // precacheImage()를 통해 홈화면을 빌드할 때 캐시에 미리 이미지를 넣어둠.
    precacheImage(
      Image.network(
              'https://terry1213.github.io/assets/flutter/Tip/precacheImage/network_image.JPG')
          .image,
      context,
    );
    // precacheImage(
    //   Image.asset('assets/atletico_madrid.jpg')
    //       .image,
    //   context,
    // );
    return Scaffold(
      appBar: AppBar(
        title: const Text('precacheImage Example'),
      ),
      body: Center(
        child: TextButton(
          child: const Text('이미지 보기'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ImagePage()),
            );
          },
        ),
      ),
    );
  }
}

// 이미지를 보여주는 화면.
class ImagePage extends StatelessWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atletico Madrid Image'),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network(
            'https://terry1213.github.io/assets/flutter/Tip/precacheImage/network_image.JPG'),
        // child: Image.asset('assets/atletico_madrid.jpg'),
      ),
    );
  }
}
