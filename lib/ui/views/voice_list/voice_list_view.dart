import 'package:eleven_labs/model/voice.dart';
import 'package:eleven_labs/ui/common/app_colors.dart';
import 'package:eleven_labs/ui/common/fonts.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'voice_list_viewmodel.dart';

class VoiceListView extends StackedView<VoiceListViewModel> {
  final List<Voice> voices;
  final void Function(Voice) onSelected;

  const VoiceListView(
      {Key? key, required this.voices, required this.onSelected})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    VoiceListViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                viewModel.closeView(context);
              },
              child: Container(
                height: 40,
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                alignment: Alignment.centerLeft,
                child: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: kcPrimaryColorDark,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: ListView.builder(
                    itemCount: voices.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          onSelected(voices[index]);
                          viewModel.closeView(context);
                        },
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xfff5f5f5),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 20),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(voices[index].name,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontFamily: FontFamily.inter,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black)),
                                        const SizedBox(height: 4),
                                        Text(voices[index].labels.info,
                                            softWrap: false,
                                            // overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontFamily: FontFamily.inter,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff89898D)))
                                      ],
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        String url = voices[index].previewUrl;
                                        viewModel.playPreview(url, index);
                                      },
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        alignment: Alignment.centerRight,
                                        child: Icon(
                                            index == viewModel.selectedIndex &&
                                                    viewModel.isPlaying
                                                ? CupertinoIcons.stop_circle
                                                : CupertinoIcons
                                                    .play_circle_fill,
                                            color: kcPrimaryColorDark,
                                            size: 24),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  VoiceListViewModel viewModelBuilder(BuildContext context) =>
      VoiceListViewModel();
}
