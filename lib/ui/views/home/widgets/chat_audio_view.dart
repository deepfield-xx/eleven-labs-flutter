import 'dart:async';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:eleven_labs/ui/common/app_colors.dart';
import 'package:eleven_labs/ui/views/home/widgets/chat_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ChatAudioWidget extends StatefulWidget {
  final ChatAudio audio;

  const ChatAudioWidget({super.key, required this.audio});

  @override
  State<ChatAudioWidget> createState() => _ChatAudioWidgetState();
}

class _ChatAudioWidgetState extends State<ChatAudioWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late StreamSubscription<PlayerState> playerStateSubscription;
  PlayerController? playerController;
  late SequenceAnimation sequenceAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 1, end: 0),
            from: const Duration(seconds: 0),
            to: const Duration(milliseconds: 100),
            tag: "loadingOpacity")
        .addAnimatable(
            animatable: Tween<double>(begin: 44, end: 160),
            from: const Duration(milliseconds: 100),
            to: const Duration(milliseconds: 400),
            tag: "width",
            curve: Curves.fastEaseInToSlowEaseOut)
        .addAnimatable(
            animatable: IntTween(begin: 0, end: 1),
            from: const Duration(milliseconds: 400),
            to: const Duration(milliseconds: 410),
            tag: "audio")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: const Duration(milliseconds: 410),
            to: const Duration(milliseconds: 500),
            tag: "playerOpacity")
        .animate(_controller);
  }

  void initAudio() {
    if (playerController == null) {
      playerController = PlayerController();
      playerStateSubscription =
          playerController!.onPlayerStateChanged.listen((event) {
        setState(() {});
      });

      playerController!.preparePlayer(
        path: widget.audio.file!.path,
        shouldExtractWaveform: true,
        noOfSamples: 200,
        volume: 1.0,
      );

      _controller.forward();
    }
  }

  @override
  void dispose() {
    playerStateSubscription.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.audio.file != null) {
      initAudio();
    }

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Column(
          children: [
            Container(
                width: sequenceAnimation["width"].value,
                height: 32,
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                decoration: const BoxDecoration(
                    color: kcPrimaryColorDark,
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: sequenceAnimation["audio"].value == 0
                    ? Opacity(
                        opacity: sequenceAnimation["loadingOpacity"].value,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: LoadingAnimationWidget.bouncingBall(
                                  color: Colors.white, size: 14),
                            )
                          ],
                        ),
                      )
                    : Opacity(
                        opacity: sequenceAnimation["playerOpacity"].value,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                playerController!
                                    .startPlayer(finishMode: FinishMode.pause);
                              },
                              child: Icon(
                                playerController!.playerState ==
                                        PlayerState.playing
                                    ? CupertinoIcons.stop_circle
                                    : CupertinoIcons.play_circle,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            AudioFileWaveforms(
                                size: const Size(120, 26),
                                enableSeekGesture: true,
                                waveformType: WaveformType.long,
                                playerWaveStyle: const PlayerWaveStyle(
                                  fixedWaveColor: Colors.white,
                                  liveWaveColor: Colors.white54,
                                  waveThickness: 2,
                                  spacing: 3,
                                ),
                                playerController: playerController!),
                            const SizedBox(
                              width: 2,
                            ),
                          ],
                        ),
                      )),
            const SizedBox(height: 10)
          ],
        );
      },
    );
  }
}
