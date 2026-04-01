import 'package:flutter/material.dart';

import '../utils/app_text.dart';

class MainErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onPressed;

  MainErrorWidget({required this.errorMessage, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Text(errorMessage, style: AppText.medium20white500),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: onPressed,
            child: Text("try again", style: AppText.medium24black500),
          ),
        ],
      ),
    );
  }
}
