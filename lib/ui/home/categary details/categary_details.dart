import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/source_response.dart';

class CategaryDetails extends StatefulWidget {
  const CategaryDetails({super.key});

  @override
  State<CategaryDetails> createState() => _CategaryDetailsState();
}

class _CategaryDetailsState extends State<CategaryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
      future: ApiManager.getSources(),
      builder: (context, snapshot) {
        // Loading state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } // server error state
        else if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                Text('Error: ${snapshot.error}'),
                ElevatedButton(
                  onPressed: () {
                    ApiManager.getSources();
                    setState(() {});
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }
        // data loaded state
        else if (snapshot.hasData) {
          var sources = snapshot.data!.sources;
          return ListView.builder(
            itemCount: sources?.length,
            itemBuilder: (context, index) {
              var source = sources![index];
              return ListTile(
                title: Text(source.name ?? 'No Name'),
                subtitle: Text(source.description ?? 'No Description'),
              );
            },
          );
        } else {
          // client error state
          return Center(
            child: Column(
              children: [
                Text('no Data Found'),
                ElevatedButton(
                  onPressed: () {
                    ApiManager.getSources();
                    setState(() {});
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
