import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workoutsss/utils/providers/workout_provider.dart';
import 'package:workoutsss/utils/schemas/workout/workout_schema.dart';
import 'package:workoutsss/widgets/forms/workout_form.dart';

class WorkoutFormDialog extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController titleTEC;
  final TextEditingController urlTEC;

  const WorkoutFormDialog({
    super.key,
    required this.titleTEC,
    required this.urlTEC,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Create Workout"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          WorkoutForm(
            formKey: formKey,
            titleTEC: titleTEC,
            urlTEC: urlTEC,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.red),
          ),
        ),
        TextButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              context.read<WorkoutProvider>().create(
                    Workout()
                      ..title = titleTEC.text
                      ..url = urlTEC.text,
                  );

              Navigator.pop(context);
            }
          },
          child: const Text(
            'Save',
          ),
        ),
      ],
    );
  }
}
