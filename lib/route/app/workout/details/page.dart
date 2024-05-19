import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workoutsss/widgets/dialogs/workout_form_dialog.dart';
import 'package:workoutsss/widgets/lists/workout_list.dart';
import 'package:workoutsss/widgets/player/yt_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WorkoutDetailPage extends StatelessWidget {
  final GoRouterState routerState;

  WorkoutDetailPage({super.key, required this.routerState});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YtPlayer(
        routerState: routerState,
      ),
    );
  }
}
