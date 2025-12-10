import 'package:flutter/material.dart';
import 'package:news_app/models/source_response.dart';
import 'package:news_app/ui/home/news/news_widget.dart';
import 'package:news_app/ui/home/categary%20details/source_tap_name.dart';
import 'package:news_app/utils/app_colors.dart';

class SourceTapWidget extends StatefulWidget {
  List<Sources> sourceaList;

  SourceTapWidget({super.key, required this.sourceaList});

  @override
  State<SourceTapWidget> createState() => _SourceTapWidgetState();
}

class _SourceTapWidgetState extends State<SourceTapWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Responsive design calculations
    var designWidth = 393;
    var deviceWidth = MediaQuery.of(context).size.width;
    var designHeight = 720;
    var deviceHeight = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: widget.sourceaList.length,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Theme.of(context).indicatorColor,
            dividerColor: AppColors.transparentColor,
            tabAlignment: TabAlignment.start,
            onTap: (int index) {
              selectedIndex = index;
              setState(() {});
            },
            isScrollable: true,
            tabs: widget.sourceaList.map((source) {
              return SourceTapName(
                source: source,
                isSelected: selectedIndex == widget.sourceaList.indexOf(source),
              );
            }).toList(),
          ),
          Expanded(
            child: NewsWidget(source: widget.sourceaList[selectedIndex]),
          ),
        ],
      ),
    );
  }
}
