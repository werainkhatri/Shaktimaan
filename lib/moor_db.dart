import 'package:moor_flutter/moor_flutter.dart';

part 'moor_db.g.dart';

class TableProfiles extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get category1 => text()();
  TextColumn get category2 => text()();
  TextColumn get category3 => text()();
  TextColumn get feedUrl => text()();
  TextColumn get lat => text()();
  TextColumn get longi => text()();
  TextColumn get address => text()();
  TextColumn get place => text()();
  TextColumn get district => text()();
  TextColumn get state => text()();
  TextColumn get country => text()();
  TextColumn get caption => text()();
  TextColumn get time => text()();
}

@UseMoor(tables: [TableProfiles,])
class Database extends _$Database {
  Database()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.splite', logStatements: true));
  
  @override
  int get schemaVersion => 1;

  Future<List<TableProfile>> getAllProfiles() => select(tableProfiles).get();
  Future insertProfile(TableProfile profile) => into(tableProfiles).insert(profile);
}
