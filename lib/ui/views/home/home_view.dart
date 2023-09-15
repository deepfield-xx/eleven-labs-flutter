import 'package:eleven_labs/model/model.dart';
import 'package:eleven_labs/model/voice.dart';
import 'package:eleven_labs/ui/common/fonts.gen.dart';
import 'package:eleven_labs/ui/common/ui_helpers.dart';
import 'package:eleven_labs/ui/views/home/widgets/chat_view.dart';
import 'package:eleven_labs/ui/views/home/widgets/segment_widget.dart';
import 'package:eleven_labs/ui/views/home/widgets/voice_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  final List<Model> models;
  final List<Voice> voices;

  const HomeView({Key? key, required this.models, required this.voices})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    viewModel.selectedVoice ??= voices.first;
    List<Model> newestModels =
        models.where((element) => models.indexOf(element) < 2).toList();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Column(
            children: [
              verticalSpaceMedium,
              SegmentControl(
                map: Map<String, String>.fromIterable(newestModels,
                    key: (model) => model.modelId,
                    value: (model) {
                      List<String> newName = model.name.split(" ");
                      newName.removeAt(0);

                      return newName.join(" ");
                    }),
                onChanged: ((String value) {
                  viewModel.rebuildUi();
                }),
              ),
              ChatView(
                messages: viewModel.messages,
                scrollController: viewModel.chatScrollController,
              ),
              VoicePicker(
                title: viewModel.selectedVoice!.name,
                description: viewModel.selectedVoice!.labels.info,
                onTap: () {
                  viewModel.showVoiceList(voices);
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: screenWidth(context) - 32 - 40,
                      child: CupertinoTextField(
                        controller: viewModel.textController,
                        cursorColor: Colors.black,
                        minLines: 1,
                        maxLines: 4,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 7),
                        style: const TextStyle(
                            fontSize: 13,
                            fontFamily: FontFamily.inter,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                        placeholder: "Message",
                        placeholderStyle: const TextStyle(
                            fontSize: 13,
                            fontFamily: FontFamily.inter,
                            fontWeight: FontWeight.w500,
                            color: CupertinoColors.inactiveGray),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffE3E4E3)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(17))),
                        onChanged: (value) {},
                      ),
                    ),
                    GestureDetector(
                      onTap: () => viewModel.sendMessage(),
                      child: Container(
                          width: 40,
                          height: 40,
                          alignment: Alignment.centerRight,
                          child: Opacity(
                              opacity: 1, // viewModel.canSend ? 1 : 0.3,
                              child: const Icon(
                                CupertinoIcons.arrow_up_circle_fill,
                                color: CupertinoColors.activeOrange,
                              ))),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
