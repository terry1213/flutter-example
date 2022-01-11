import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'precachePicture()',
      home: HomePage(),
    );
  }
}

// 처음 보이는 홈화면.
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // precachePicture()를 통해 홈화면을 빌드할 때 캐시에 미리 svg 이미지를 넣음.
    precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, 'assets/flutter_logo.svg'),
      context, // null도 들어갈 수 있다.
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('precachePicture() Example'),
      ),
      body: Center(
        child: TextButton(
          child: const Text('이미지 보기'),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const ImagePage(),
                // 확실히 차이를 보기 위해 화면 전환 애니메이션 삭제.
                transitionDuration: const Duration(seconds: 0),
              ),
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
        title: const Text('Svg Image'),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: SvgPicture.asset(
            'assets/flutter_logo.svg',
          height: 500,
        ),
      ),
    );
  }
}