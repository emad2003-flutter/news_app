import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/source_response.dart';
import 'package:news_app/ui/home/categary%20details/source_tap_widget.dart';

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
          return snapshot.data!.status == "error"
              ? Center(
                  child: Column(
                    children: [
                      Text('Error: ${snapshot.data!.message}'),
                      ElevatedButton(
                        onPressed: () {
                          ApiManager.getSources();
                          setState(() {});
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : SourceTapWidget(sourceaList: sources ?? []);
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
