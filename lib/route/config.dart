import 'package:go_router/go_router.dart';
import 'package:workoutsss/route/app/home/page.dart';
import 'package:workoutsss/route/app/workout/details/page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/workout/:id',
      builder: (context, state) => WorkoutDetailPage(
        routerState: state,
      ),
    ),
  ],
);
