import 'dart:io';

import 'package:eleven_labs/app/app.locator.dart';
import 'package:eleven_labs/app/app.router.dart';
import 'package:eleven_labs/model/voice.dart';
import 'package:eleven_labs/services/api_service.dart';
import 'package:eleven_labs/ui/views/home/widgets/chat_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _apiService = locator<ApiService>();
  final textController = TextEditingController(text: '');

  Voice? selectedVoice;
  bool canSend = false;

  List<ChatItem> messages = List.empty(growable: true);
  ScrollController chatScrollController = ScrollController();

  void showVoiceList(List<Voice> voices) {
    _navigationService.navigateToVoiceListView(
        voices: voices,
        onSelected: (Voice voice) {
          selectedVoice = voice;
          rebuildUi();
        });
  }

  void sendMessage() async {
    ChatMessage message = ChatMessage(
        text: textController.text, date: DateTime.now(), isSentByMe: true);
    messages.add(message);

    ChatAudio audio = ChatAudio();
    messages.add(audio);

    final text = textController.text;
    textController.clear();
    rebuildUi();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToEnd();
    });

    final List<int> audioData = await _apiService.textToSpeech(
      text,
      "eleven_multilingual_v2",
      selectedVoice?.voiceId ?? "",
    );
    final directory = await getApplicationDocumentsDirectory();
    final file = File("${directory.path}/${audio.id}.mp3");
    file.writeAsBytes(audioData);

    audio.file = file;
    rebuildUi();
  }

  void scrollToEnd() {
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
