import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:workoutsss/utils/providers/workout_provider.dart';
import 'package:workoutsss/utils/validation/title_validation.dart';
import 'package:workoutsss/utils/validation/url_validation.dart';

class WorkoutForm extends StatelessWidget {
  final TextEditingController titleTEC;
  final TextEditingController urlTEC;
  final GlobalKey<FormState> formKey;

  WorkoutForm({
    super.key,
    required this.titleTEC,
    required this.urlTEC,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutProvider>(
      builder: (context, value, child) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleTEC,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (fVAlue) =>
                    value.validateTitle(fVAlue ?? "").error?.getMessage(),
                decoration: const InputDecoration(
                  label: Text("Workout Title"),
                ),
                cursorErrorColor: value.validateTitle(titleTEC.text).isNotValid
                    ? Colors.red
                    : null,
              ),
              TextFormField(
                controller: urlTEC,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  label: Text("Workout Youtube URL"),
                ),
                validator: (fValue) =>
                    value.validateUrl(fValue ?? "").error?.getMessage(),
                cursorErrorColor: value.validateUrl(urlTEC.text).isNotValid
                    ? Colors.red
                    : null,
              ),
            ],
          ),
        );
      },
    );
  }
}
