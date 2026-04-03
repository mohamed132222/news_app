import 'package:flutter/material.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/app_text.dart';

class SelectedItem extends StatefulWidget {
  final String title;
  final List<String> options;
  final ValueChanged<String> onChanged;

  const SelectedItem({
    super.key,
    required this.title,
    required this.options,
    required this.onChanged,
  });

  @override
  State<SelectedItem> createState() => _SelectedItemState();
}

class _SelectedItemState extends State<SelectedItem> {
  bool isOpen = false;
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: width * 0.02,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.04,
              vertical: width * 0.03,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width * 0.04),
              border: Border.all(color: AppColor.white, width: 3),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(selectedValue, style: AppText.medium20white500),
                Icon(
                  isOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down_outlined,
                  color: AppColor.white,
                ),
              ],
            ),
          ),
        ),

        if (isOpen)
          Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.03),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.white, width: 3),
              borderRadius: BorderRadius.circular(width * 0.04),
            ),
            child: Column(
              children: widget.options.map((option) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedValue = option;
                      isOpen = false;
                    });

                    widget.onChanged(option); // send value outside
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04,
                      vertical: width * 0.03,
                    ),
                    child: Text(option, style: AppText.medium20white500),
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
