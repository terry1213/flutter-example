import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IgnorePointer',
      theme: ThemeData(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _ignore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IgnorePointer Example'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => setState(() => _ignore = !_ignore),
              child: Text('ignore:$_ignore'),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Button clicked'),
                      ),
                    ),
                    child: const Text('Click me'),
                  ),
                  IgnorePointer(
                    ignoring: _ignore,
                    child: Container(
                      color: Colors.yellow.withOpacity(0.3),
                      height: double.maxFinite,
                      width: double.maxFinite,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
