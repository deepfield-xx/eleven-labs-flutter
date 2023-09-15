import 'package:json_annotation/json_annotation.dart';

part 'voice.g.dart';

@JsonSerializable()
class VoiceLabels {
  final String? accent;
  final String? description;
  final String? gender;
  final String? age;

  VoiceLabels(this.accent, this.description, this.gender, this.age);

  String get info {
    return [accent, description, gender]
        .where((element) => element != null)
        .join(", ");
  }

  factory VoiceLabels.fromJson(Map<String, dynamic> json) =>
      _$VoiceLabelsFromJson(json);

  Map<String, dynamic> toJson() => _$VoiceLabelsToJson(this);
}

@JsonSerializable()
class Voice {
  @JsonKey(name: 'voice_id')
  final String voiceId;
  final String name;
  @JsonKey(name: 'preview_url')
  final String previewUrl;
  final VoiceLabels labels;

  Voice(
      {required this.voiceId,
      required this.name,
      required this.previewUrl,
      required this.labels});

  factory Voice.fromJson(Map<String, dynamic> json) => _$VoiceFromJson(json);

  Map<String, dynamic> toJson() => _$VoiceToJson(this);
}
