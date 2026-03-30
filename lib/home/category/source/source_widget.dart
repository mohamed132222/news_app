import 'package:flutter/material.dart';
import 'package:news_app/home/category/news/news_widget.dart';
import 'package:news_app/home/category/source/source_item.dart';
import 'package:news_app/models/source_response.dart';
import 'package:news_app/utils/app_color.dart';

class SourceWidget extends StatefulWidget {
  List<Source> sourcesList = [];

  SourceWidget({required this.sourcesList});

  @override
  State<SourceWidget> createState() => _SourceWidgetState();
}

class _SourceWidgetState extends State<SourceWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
            onTap: (newIndex) {
              selectedIndex = newIndex;
              setState(() {});
            },
            tabs: widget.sourcesList.map((sources) {
              return SourceItem(
                sources: sources,
                isSelected:
                    selectedIndex == widget.sourcesList.indexOf(sources),
              );
            }).toList(),
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            indicatorColor: AppColor.white,
            dividerColor: Colors.transparent,
          ),
          Expanded(
            child: NewsWidget(source: widget.sourcesList[selectedIndex]),
          ),
        ],
      ),
    );
  }
}
