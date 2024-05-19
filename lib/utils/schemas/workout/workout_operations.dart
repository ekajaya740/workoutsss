import 'package:isar/isar.dart';
import 'package:workoutsss/utils/db.dart';
import 'package:workoutsss/utils/schemas/workout/workout_schema.dart';

class WorkoutOperations {
  final dbService = IsarService();
  Future<void> create(Workout schema) async {
    final isar = await dbService.db;

    await isar.writeTxn(() async => await isar.workouts.put(schema));
  }

  Future<Workout?> get(int id) async {
    final isar = await dbService.db;

    return await isar.workouts.get(id);
  }

  Future<List<Workout?>> getAll() async {
    final isar = await dbService.db;

    return await isar.workouts.where().findAll();
  }

  Future<void> update(Workout schema) async {
    final isar = await dbService.db;

    await isar.writeTxn(() async => await isar.workouts.put(schema));
  }

  Future<void> delete(int id) async {
    final isar = await dbService.db;

    await isar.writeTxn(() async => await isar.workouts.delete(id));
  }

  Future<void> reset() async {
    final isar = await dbService.db;

    await isar.writeTxn(() async => await isar.workouts.deleteAll([]));
  }
}
