import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_json_stories/models/news_data.dart';
import 'package:provider_json_stories/pages/stories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => NewsData(),
        builder: (context, child) {
          return StoriesPage();
        
        },
      ),
    );
  }
}
     