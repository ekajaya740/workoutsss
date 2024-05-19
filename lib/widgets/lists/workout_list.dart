import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:workoutsss/utils/providers/workout_provider.dart';
import 'package:provider/provider.dart';

class WorkoutList extends StatelessWidget {
  const WorkoutList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<WorkoutProvider>(
        builder: (context, value, child) {
          if (value.loading) {
            return const CircularProgressIndicator();
          }

          return ListView.builder(
            shrinkWrap: true,
            itemCount: value.workouts.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  value.workouts[index]?.title ?? "",
                ),
                onTap: () {
                  context.push("/workout/${value.workouts[index]!.id}");
                },
                trailing: const Icon(Icons.chevron_right),
              );
            },
          );
        },
      ),
    );
  }
}
