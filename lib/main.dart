import 'package:flutter/material.dart';
import 'package:flutter_tasks/pages/index_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBW7EliAERhfchxXXGvCFqdzzLCZwiVi9ZlQ&s',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Image.network(
          'data:image/png;base64,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',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
