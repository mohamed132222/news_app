import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/settings/settings_provider.dart';
import '../utils/app_color.dart';

class MainLoadingWidget extends StatelessWidget {
  const MainLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    return Center(
      child: CircularProgressIndicator(
        color: provider.isDark() ? AppColor.white : AppColor.black,
      ),
    );
  }
}
