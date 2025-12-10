import 'package:flutter/material.dart';
import 'package:news_app/models/source_response.dart';

class SourceTapName extends StatelessWidget {
  Sources source;
  bool isSelected;
  SourceTapName({super.key, required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(
      source.name ?? '',
      style: isSelected
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.labelMedium,
    );
  }
}
