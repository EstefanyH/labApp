import 'package:applab/src/core/routing/routes.dart';
import 'package:applab/src/features/account/presentation/account_page.dart';
import 'package:applab/src/features/auth/presentation/pages/login_page.dart';
import 'package:applab/src/features/home/presentation/pages/home_page.dart';
import 'package:applab/src/features/search/presentation/pages/seach_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: AppRouter.login,
        builder: (ctx, state) => const LoginPage()),
      GoRoute(
        path: AppRouter.home,
        builder: (ctx, state) => const HomePage()),
      GoRoute(
        path: AppRouter.search,
        builder: (ctx, state) => const SearchPage()),
      GoRoute(
        path: AppRouter.account,
        builder: (ctx, state) => const AccountPage())  
    ]);
});