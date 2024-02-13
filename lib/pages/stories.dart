import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_json_stories/models/news_data.dart';
import 'package:provider_json_stories/widgets/news_card.dart';

class StoriesPage extends StatelessWidget {
  const StoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NewsData>().fetchData;

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  context.read<NewsData>().initialValues();
                  context.read<NewsData>().fetchData;
                },
                icon: Icon(Icons.refresh))
          ],
          title: const Text('Top stories - CBS News'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await context.read<NewsData>().fetchData;
          },
          child: Center(child: Consumer<NewsData>(
            builder: (context, value, child) {
              return value.map.isEmpty && !value.error
                  ? CircularProgressIndicator()
                  : value.error
                      ? Text(
                          'Opps, something went wrong. ${value.errorMessage}',
                          textAlign: TextAlign.center,
                        )
                      : ListView.builder(
                          itemCount: value.map['stories'].length,
                          itemBuilder: (context, index) {
                            return NewsCard(map: value.map['stories'][index]);
                          },
                        );
            },
          )),
        ));
  }
}

