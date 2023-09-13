import 'package:flutter/material.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TrendingScreen'),
      ),
      body: const Center(
        child: Text('TrendingScreen'),
      ),
    );
  }
}
