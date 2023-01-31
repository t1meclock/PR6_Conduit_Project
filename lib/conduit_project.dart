import 'dart:io';
import 'package:conduit/conduit.dart';
import 'package:conduit_project/controllers/app_token_contoller.dart';
import 'package:conduit_project/controllers/app_user_contoller.dart';
import 'package:conduit_project/controllers/app_history_controller.dart';
import 'package:conduit_project/controllers/app_note_controller.dart';


import 'controllers/app_auth_controller.dart';

class AppService extends ApplicationChannel {
  late final ManagedContext managedContext;

  @override
  Future prepare() {
    final PersistentStore = _initDatabase();

    managedContext = ManagedContext(
        ManagedDataModel.fromCurrentMirrorSystem(), PersistentStore);
    return super.prepare();
  }

  @override
  Controller get entryPoint => Router()
    ..route('token/[:refresh]').link(
      () => AppAuthContoler(managedContext),
    )
    ..route('user')
        .link(AppTokenContoller.new)!
        .link(() => AppUserConttolelr(managedContext))
    ..route('notes/[:number]')
        .link(AppTokenContoller.new)!
        .link(() => AppNoteController(managedContext))
    ..route('history')
        .link(AppTokenContoller.new)!
        .link(() => AppHistoryController(managedContext));

  PersistentStore _initDatabase() {
    final username = Platform.environment['DB_USERNAME'] ?? 'postgres';
    final password = Platform.environment['DB_PASSWORD'] ?? '1234';
    final host = Platform.environment['DB_HOST'] ?? 'localhost';
    final port = int.parse(Platform.environment['DB_PORT'] ?? '5432');
    final databaseName = Platform.environment['DB_NAME'] ?? 'notesDB';
    return PostgreSQLPersistentStore(
        username, password, host, port, databaseName);
  }
} 