import 'package:conduit/conduit.dart';
import 'package:conduit_project/model/user.dart';

class History extends ManagedObject<_History> implements _History {}

class _History {
  @primaryKey
  int? id;
  @Column(nullable: false)
  String? action;
  @Column(nullable: false)
  String? dateOfEditHistory;
  
  @Relate(#historyList, isRequired: true, onDelete: DeleteRule.cascade)
  User? user;
}