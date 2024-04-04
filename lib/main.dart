import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:flutter_villains/villain.dart';
import 'package:flutter_villains/villains/villains.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shamil',
      home: Villain(
        villainAnimation: VillainAnimation.fade(),
        child: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    Villain(
                  villainAnimation: VillainAnimation.fade(),
                  secondaryVillainAnimation: VillainAnimation.scale(
                    fromScale: 0.5,
                    toScale: 1,
                  ),
                  child: DetailScreen(),
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            );
          },
          child: Text('Go to Test Screen'),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildWaveWidget(),
            ElevatedButton(
              onPressed: () {
                VillainController.playAllVillains(
                  context,
                );
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWaveWidget() {
    return Container(
      height: 200,
      child: WaveWidget(
        config: CustomConfig(
          gradients: [
            [Colors.red, Color(0xEEF44336)],
            [Colors.red[800]!, Color(0x77E57373)],
            [Colors.orange, Color(0x66FF9800)],
            [Colors.yellow, Color(0x55FFEB3B)]
          ],
          durations: [35000, 19440, 10800, 6000],
          heightPercentages: [0.20, 0.23, 0.25, 0.30],
          gradientBegin: Alignment.bottomLeft,
          gradientEnd: Alignment.topRight,
        ),
        size: Size(double.infinity, double.infinity),
        waveAmplitude: 10,
      ),
    );
  }
}
