import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class VoiceListViewModel extends BaseViewModel {
  Audio? audio;
  bool isPlaying = false;
  int? selectedIndex;

  void playPreview(String path, int index) async {
    if (index != selectedIndex) {
      stop();
      audio = Audio.loadFromRemoteUrl(path);
      audio?.play();
      isPlaying = true;
      selectedIndex = index;
      rebuildUi();
    } else {
      stop();
    }
  }

  void stop() {
    if (audio != null) {
      audio?.pause();
      audio?.dispose();
    }
    isPlaying = false;
    selectedIndex = null;
    rebuildUi();
  }

  void closeView(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    stop();
    super.dispose();
  }
}
