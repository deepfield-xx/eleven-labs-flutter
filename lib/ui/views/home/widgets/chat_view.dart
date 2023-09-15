import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:eleven_labs/ui/common/fonts.gen.dart';
import 'package:eleven_labs/ui/views/home/widgets/chat_audio_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:uuid/uuid.dart';

class ChatItem {
  final String id;

  ChatItem({required this.id});
}

class ChatMessage extends ChatItem {
  final String text;
  final DateTime date;
  final bool isSentByMe;

  ChatMessage(
      {required this.text, required this.date, required this.isSentByMe})
      : super(id: const Uuid().v1());
}

class ChatIndicator extends ChatItem {
  ChatIndicator() : super(id: const Uuid().v1());
}

class ChatAudio extends ChatItem {
  bool isPlaying = false;
  PlayerController controller = PlayerController();
  File? file;

  ChatAudio() : super(id: const Uuid().v1()) {}
}

class ChatView extends StatefulWidget {
  final List<ChatItem> messages;
  final ScrollController scrollController;

  const ChatView(
      {super.key, required this.messages, required this.scrollController});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: GroupedListView(
            controller: widget.scrollController,
            itemBuilder: (context, item) {
              if (item is ChatMessage) {
                return chatMessage(item);
              } else if (item is ChatAudio) {
                return chatAudio(item);
              } else {
                return Container();
              }
            },
            elements: widget.messages,
            groupHeaderBuilder: (message) => const SizedBox(),
            groupBy: (message) => ""),
      ),
    );
  }

  Widget chatAudio(ChatAudio audio) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ChatAudioWidget(audio: audio),
    );
  }

  Widget chatMessage(ChatMessage message) {
    return Align(
      alignment:
          message.isSentByMe ? Alignment.centerLeft : Alignment.centerRight,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Color(0xfff5f5f5),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                message.text,
                style: const TextStyle(
                    height: 1.4,
                    fontSize: 14,
                    fontFamily: FontFamily.inter,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
