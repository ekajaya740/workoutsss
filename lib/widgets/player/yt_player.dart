import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:workoutsss/utils/providers/workout_provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YtPlayer extends StatelessWidget {
  final GoRouterState routerState;
  const YtPlayer({
    super.key,
    required this.routerState,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutProvider>(
      builder: (context, value, child) {
        return Builder(builder: (_) {
          final videoId = YoutubePlayer.convertUrlToId(value.workouts
                      .where((test) =>
                          test!.id ==
                          int.parse(routerState.pathParameters['id'] ?? ""))
                      .first!
                      .url ??
                  "") ??
              "";

          if (videoId.isEmpty) {
            return const Text("Error");
          }

          final YoutubePlayerController controller = YoutubePlayerController(
            initialVideoId: videoId,
            flags: const YoutubePlayerFlags(enableCaption: false, mute: false),
          );

          return YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: controller,
              showVideoProgressIndicator: true,
            ),
            builder: (context, player) => Container(
              child: player,
            ),
          );
        });
      },
    );
  }
}
