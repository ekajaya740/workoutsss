import 'package:isar/isar.dart';

part 'workout_schema.g.dart';

@collection
class Workout {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  String? title;

  @Index(type: IndexType.value)
  String? url;
}
