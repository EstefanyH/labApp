import 'package:applab/src/core/routing/routes.dart';
import 'package:applab/src/features/home/presentation/pages/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: AppRouter.home,
        builder: (ctx, state) => const HomePage()),
      GoRoute(
        path: AppRouter.home,
        builder: (ctx, state) => const HomePage())  
    ]);
});