import 'package:flutter/material.dart';
import 'package:news_app/models/source_response.dart';
import 'package:news_app/utils/app_text.dart';

class SourceItem extends StatelessWidget {
  Source sources;
  bool isSelected;

  SourceItem({required this.sources, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(
      sources?.name ?? "",
      style: isSelected ? AppText.bold16white700 : AppText.medium14white500,
    );
  }
}
