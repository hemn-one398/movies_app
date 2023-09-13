import 'package:flutter/material.dart';
import 'package:iq_movies_app/feature/trending_movies/presentation/view/widgets/trending_listview.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({Key? key}) : super(key: key);

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TrendingScreen'),
      ),
      body: const Column(
        children: [
          TextField(
              decoration: InputDecoration(
            hintText: 'Search by title',
          )),
          Expanded(child: TrendingListView()),
        ],
      ),
    );
  }
}
