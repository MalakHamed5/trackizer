import 'package:go_router/go_router.dart';

import '../../../features/auth/presentation/pages/welcome_page.dart';
import '../../../features/auth/presentation/pages/sign_up_with.dart';
import '../../const/app_routers.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRouter.welcome,
  routes: [
    GoRoute(
      path: AppRouter.welcome,
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: AppRouter.signup,
      builder: (context, state) => const SignUpWith(),
    ),
  ],
);
