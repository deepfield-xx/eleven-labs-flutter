import 'package:dio/dio.dart';
import 'package:eleven_labs/config.dart';
import 'package:eleven_labs/model/model.dart';
import 'package:eleven_labs/model/voice.dart';

class ApiService {
  final dio = Dio();

  ApiService() {
    dio.options.baseUrl = 'https://api.elevenlabs.io';
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 20);
  }

  Future<List<Model>> getModels() async {
    final response = await dio.get('/v1/models',
        options: Options(headers: {
          "Accept": "application/json",
          "xi-api-key": Config.apiKey
        }));

    final modelsMaps = response.data as List;
    return modelsMaps
        .map((e) => Model.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<Voice>> getVoices() async {
    final response = await dio.get('/v1/voices',
        options: Options(headers: {"Accept": "application/json"}));

    final modelsMaps = response.data["voices"] as List;
    return modelsMaps
        .map((e) => Voice.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<int>> textToSpeech(
      String text, String modelId, String voiceId) async {
    final data = {
      "text": text,
      "model_id": modelId,
      "voice_settings": {"stability": 0.5, "similarity_boost": 0.5}
    };
    final response = await dio.post('/v1/text-to-speech/$voiceId',
        data: data,
        options: Options(headers: {
          "Accept": "audio/mpeg",
          "xi-api-key": Config.apiKey,
        }, responseType: ResponseType.bytes));

    return response.data;
  }
}
