import 'package:isar/isar.dart';

part 'state_model.g.dart';

@collection
class StateModel {
  Id id = Isar.autoIncrement;

  late int year;
  late int month;
  late int day;
  late int currentReminderMillis;
  int? startedAtMillis;
}
