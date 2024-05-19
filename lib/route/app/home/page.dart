import 'package:flutter/material.dart';
import 'package:workoutsss/widgets/dialogs/workout_form_dialog.dart';
import 'package:workoutsss/widgets/forms/workout_form.dart';
import 'package:workoutsss/widgets/lists/workout_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleTEC = TextEditingController();
  final TextEditingController _urlTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Let's Workout!",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              WorkoutList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => WorkoutFormDialog(
              formKey: _formKey,
              titleTEC: _titleTEC,
              urlTEC: _urlTEC,
            ),
          );
        },
      ),
    );
  }
}
