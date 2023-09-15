// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoiceLabels _$VoiceLabelsFromJson(Map<String, dynamic> json) => VoiceLabels(
      json['accent'] as String?,
      json['description'] as String?,
      json['gender'] as String?,
      json['age'] as String?,
    );

Map<String, dynamic> _$VoiceLabelsToJson(VoiceLabels instance) =>
    <String, dynamic>{
      'accent': instance.accent,
      'description': instance.description,
      'gender': instance.gender,
      'age': instance.age,
    };

Voice _$VoiceFromJson(Map<String, dynamic> json) => Voice(
      voiceId: json['voice_id'] as String,
      name: json['name'] as String,
      previewUrl: json['preview_url'] as String,
      labels: VoiceLabels.fromJson(json['labels'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VoiceToJson(Voice instance) => <String, dynamic>{
      'voice_id': instance.voiceId,
      'name': instance.name,
      'preview_url': instance.previewUrl,
      'labels': instance.labels,
    };
