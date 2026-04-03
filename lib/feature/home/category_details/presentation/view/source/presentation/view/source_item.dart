import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../core/provider/settings/settings_provider.dart';
import '../../data/model/source_response.dart';

class SourceItem extends StatelessWidget {
  Source sources;
  bool isSelected;

  SourceItem({required this.sources, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Text(
      sources?.name ?? "",
      style: isSelected
          ? provider.isDark()
                ? TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColor.white,
                  )
                : TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColor.black,
                  )
          : provider.isDark()
          ? TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColor.white,
            )
          : TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColor.black,
            ),
    );
  }
}
