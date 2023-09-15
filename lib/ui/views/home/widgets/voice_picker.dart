import 'package:eleven_labs/ui/common/app_colors.dart';
import 'package:eleven_labs/ui/common/fonts.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VoicePicker extends StatefulWidget {
  final String title;
  final String description;
  final void Function() onTap;
  const VoicePicker(
      {super.key,
      required this.title,
      required this.description,
      required this.onTap});

  @override
  State<VoicePicker> createState() => _VoicePickerState();
}

class _VoicePickerState extends State<VoicePicker> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: IntrinsicWidth(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: const BoxDecoration(
              color: kcPrimaryColorDark,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            children: [
              const Icon(
                CupertinoIcons.waveform,
                color: Colors.white,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(widget.title,
                  style: const TextStyle(
                      fontSize: 12,
                      fontFamily: FontFamily.inter,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
              const SizedBox(width: 6)
            ],
          ),
        ),
      ),

      // child: IntrinsicHeight(
      //   child: Container(
      //     decoration: const BoxDecoration(
      //         color: Color(0xfff5f5f5),
      //         borderRadius: BorderRadius.all(Radius.circular(10))),
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      //       child: Column(children: [
      //         Text(widget.title,
      //             style: const TextStyle(
      //                 fontSize: 12,
      //                 fontFamily: FontFamily.inter,
      //                 fontWeight: FontWeight.w600,
      //                 color: Colors.black)),
      //         const SizedBox(height: 1),
      //         Text(widget.description,
      //             style: const TextStyle(
      //                 fontSize: 12,
      //                 fontFamily: FontFamily.inter,
      //                 fontWeight: FontWeight.w400,
      //                 color: Color(0xff89898D)))
      //       ]),
      //     ),
      //   ),
      // ),
    );
  }
}
