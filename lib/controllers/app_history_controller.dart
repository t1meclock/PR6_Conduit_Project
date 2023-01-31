import 'dart:async';
import 'dart:io';
import 'package:conduit/conduit.dart';
import '../model/history.dart';
import '../utils/app_response.dart';
import '../utils/app_utils.dart';

class AppHistoryController extends ResourceController {
  AppHistoryController(this.managedContext);
  final ManagedContext managedContext;

  @Operation.get()
  Future<Response> getHistory(
      @Bind.header(HttpHeaders.authorizationHeader) String header) async {

    try {
      final id = AppUtils.getIdFromHeader(header);
      final qHistory = Query<History>(managedContext)
        ..where((history) => history.user!.id).equalTo(id);
      final List<History> historyList = await qHistory.fetch();
      if (historyList.isEmpty)
        return AppResponse.ok(message: "История недоступна");
      else {
        historyList.forEach((element) { element.removePropertiesFromBackingMap(["id", "user"]);
        });
      }
      return Response.ok(historyList);
    } catch (e) {
      return AppResponse.serverError(e, message: 'Ошибка при получении истории');
    }
  }
}