import 'package:applab/src/core/routing/routes.dart';
import 'package:applab/src/features/home/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

GoRouter createRouter(bool isAuthentificated) {
  return GoRouter(
    redirect: (ctx, state){
      
    },
    routes: [
      /*GoRoute(
        path: AppRouter.login,
        name: 'login',
        builder: (ctx, state) => const LoginPage()), */
      GoRoute(
        path: AppRouter.home,
        name: 'home',
        builder: (ctx, state) => const HomePage())  
    ]);
}