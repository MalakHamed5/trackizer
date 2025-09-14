import 'package:go_router/go_router.dart';

import '../../../features/auth/presentation/pages/sign_in_page.dart';
import '../../../features/auth/presentation/pages/sign_up_with_emil.dart';
import '../../../features/auth/presentation/pages/welcome_page.dart';
import '../../../features/auth/presentation/pages/sign_up_with.dart';
import 'routers_name.dart';

final GoRouter router = GoRouter(
  initialLocation: RoutersName.welcome,
  routes: [
    GoRoute(
      path: RoutersName.welcome,
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: RoutersName.signup,
      builder: (context, state) => const SignUpWith(),
    ),
    GoRoute(
      path: RoutersName.singupWithEmil,
      builder: (context, state) => const SignUpWithEmil(),
    ),
    GoRoute(
      path: RoutersName.signin,
      builder: (context, state) => const SignInPage(),
    ),
  ],
);
