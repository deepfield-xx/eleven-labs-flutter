import 'package:eleven_labs/model/model.dart';
import 'package:eleven_labs/model/voice.dart';
import 'package:eleven_labs/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:eleven_labs/app/app.locator.dart';
import 'package:eleven_labs/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends FutureViewModel {
  final _navigationService = locator<NavigationService>();
  final _apiService = locator<ApiService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    List<Model> models = await _apiService.getModels();
    List<Voice> voices = await _apiService.getVoices();
    await Future.delayed(const Duration(seconds: 1));

    _navigationService.navigateToHomeView(models: models, voices: voices);
  }

  @override
  Future futureToRun() => runStartupLogic();
}
