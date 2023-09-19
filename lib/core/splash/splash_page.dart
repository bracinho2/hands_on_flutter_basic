import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    initSplash();
    super.initState();
  }

  Future<void> initSplash() async {
    await Future.delayed(const Duration(seconds: 3)).then((value) async {
      Modular.to.navigate('/jokes');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              'https://cdn2.iconfinder.com/data/icons/people-flat-design/64/Funny-Laughing-Joke-Fun-Haha-Avatar-Man-512.png',
            ),
          ),
          Center(
            child: Text(
              'My Jokes',
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
