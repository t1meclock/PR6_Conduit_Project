import 'package:conduit/conduit.dart';
import 'package:conduit_project/model/user.dart';

class Note extends ManagedObject<_Note> implements _Note {}

class _Note {
  @primaryKey
  int? id;
  @Column(nullable: false)
  int? number;
  @Column(unique: true, nullable: false)
  String? name;
  @Column(nullable: false)
  String? description;
  @Column(nullable: false)
  String? category;
  @Column(nullable: false)
  String? dateOfCreation;
  @Column(nullable: false)
  String? dateOfEdit;
  @Column(nullable: false)
  bool? deleted;

  @Relate(#notesList, isRequired: true, onDelete: DeleteRule.cascade)
  User? user;
}