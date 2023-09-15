import 'package:eleven_labs/ui/common/fonts.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SegmentControl extends StatefulWidget {
  final Map<String, String> map;
  final void Function(String) onChanged;

  const SegmentControl({super.key, required this.map, required this.onChanged});

  @override
  State<SegmentControl> createState() => _SegmentControlState();
}

class _SegmentControlState extends State<SegmentControl> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    selectedItem ??= widget.map.keys.first;

    final Map<String, Widget> viewMap = widget.map.map((key, value) {
      return MapEntry(
          key,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon(Icons.donut_small_outlined),
                Text(
                  value,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontFamily.inter,
                      fontWeight: FontWeight.w600,
                      color: selectedItem == key
                          ? Colors.black
                          : CupertinoColors.inactiveGray),
                ),
              ],
            ),
          ));
    });

    return CupertinoSlidingSegmentedControl<String>(
      thumbColor: Colors.white,
      backgroundColor: const Color(0xfff5f5f5),
      groupValue: selectedItem,
      children: viewMap,
      onValueChanged: (String? value) {
        if (value != null) {
          setState(() {
            selectedItem = value;
          });
          widget.onChanged(value);
        }
      },
    );
  }
}
