import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/models/source_response.dart';
import 'package:news_app/ui/home/news/news_item.dart';

class NewsWidget extends StatefulWidget {
  Sources source;
  NewsWidget({super.key, required this.source});
  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    // Responsive design calculations
    var designWidth = 393;
    var deviceWidth = MediaQuery.of(context).size.width;
    var designHeight = 720;
    var deviceHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16 * deviceWidth / designWidth),
      child: FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsBySourceId(widget.source.id ?? ""),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  Text('Error: ${snapshot.error}'),
                  ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsBySourceId(widget.source.id ?? "");
                      setState(() {});
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else if (snapshot.data!.status == "error") {
            return Center(
              child: Column(
                children: [
                  Text('Error: ${snapshot.data!.message}'),
                  ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsBySourceId(widget.source.id ?? "");
                      setState(() {});
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else {
            final newsList = snapshot.data?.articles ?? [];
            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                final newsItem = newsList[index];
                return NewsItem(news: newsItem);
              },
            );
          }
        },
      ),
    );
  }
}
