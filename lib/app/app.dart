import 'package:to_do_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:to_do_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:to_do_app/services/todos_service.dart';
import 'package:to_do_app/ui/views/todos/todos_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: TodosView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: TodosService),
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
