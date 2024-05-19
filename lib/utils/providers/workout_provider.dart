import 'package:flutter/material.dart';
import 'package:workoutsss/utils/schemas/workout/workout_operations.dart';
import 'package:workoutsss/utils/schemas/workout/workout_schema.dart';
import 'package:workoutsss/utils/validation/title_validation.dart';
import 'package:workoutsss/utils/validation/url_validation.dart';

class WorkoutProvider with ChangeNotifier {
  WorkoutProvider() {
    getAll();
  }

  final _workoutOps = WorkoutOperations();

  bool _loading = false;
  // Workout? _workout;
  List<Workout?> _workouts = [];

  bool get loading => _loading;
  // Workout? get workout => _workout;
  List<Workout?> get workouts {
    return _workouts;
  }

  TitleFormz validateTitle(String value) {
    return TitleFormz.pure(value);
  }

  URLFormz validateUrl(String value) => URLFormz.pure(value);

  Future<void> getAll() async {
    _loading = true;
    notifyListeners();
    try {
      final data = await _workoutOps.getAll();
      _workouts = data;
    } catch (e) {
      print(e);
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void create(Workout schema) async {
    try {
      await _workoutOps.create(schema);
    } catch (e) {
      print(e);
    } finally {
      await getAll();
      notifyListeners();
    }
  }
}
