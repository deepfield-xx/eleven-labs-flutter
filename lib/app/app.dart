import 'package:eleven_labs/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:eleven_labs/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:eleven_labs/ui/views/home/home_view.dart';
import 'package:eleven_labs/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:eleven_labs/services/api_service.dart';
import 'package:eleven_labs/ui/views/voice_list/voice_list_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: VoiceListView, fullscreenDialog: true),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
