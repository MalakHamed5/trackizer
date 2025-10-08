import 'package:go_router/go_router.dart';
import 'package:trackizer/features/home/data/models/user_model.dart';
import 'package:trackizer/features/home/presentation/pages/card_page.dart';
import 'package:trackizer/features/home/presentation/pages/info_subscription.dart';
import 'package:trackizer/features/home/presentation/pages/new_subscription.dart';
import 'package:trackizer/features/home/presentation/pages/setting_page.dart';
import 'package:trackizer/features/home/presentation/pages/spending_budget_page.dart';

import '../../../features/auth/presentation/pages/sign_in_page.dart';
import '../../../features/auth/presentation/pages/sign_up_with_emil.dart';
import '../../../features/auth/presentation/pages/welcome_page.dart';
import '../../../features/auth/presentation/pages/sign_up_with.dart';
import '../../../features/home/presentation/pages/calendar_page.dart';
import '../../../features/home/presentation/pages/home_page.dart';

class AppRouter {
  static const welcome = '/';
  static const signup = '/signup';
  static const singupWithEmil = '/signup_with_email';
  static const signin = '/signin';
  static const home = '/home';
  static const calendar = '/calendar';
  static const card = '/card';
  static const spendingBuget = '/spendingBuget';
  static const sub = '/newsubscription';
  static const infoSub = '/infoSubscription';
  static const setting = '/setting';

  static final GoRouter router = GoRouter(
    initialLocation: welcome,
    routes: [

      // --- Auth --- //
      GoRoute(path: welcome, builder: (context, state) => const WelcomePage()),
      GoRoute(path: signup, builder: (context, state) => const SignUpWith()),
      GoRoute(
        path: singupWithEmil,
        builder: (context, state) => const SignUpWithEmil(),
      ),
      GoRoute(path: signin, builder: (context, state) => const SignInPage()),
      GoRoute(path: sub, builder: (context, state) => const NewSubscription()),

      // --- NavBar ---//
      GoRoute(path: home, builder: (context, state) => const HomePage()),
      GoRoute(
        path: calendar,
        builder: (context, state) => const CalendarPage(),
      ),
      GoRoute(
        path: spendingBuget,
        builder: (context, state) => const SpendingBugetPage(),
      ),  GoRoute(
        path: card,
        builder: (context, state) => const CardDemoPage(),
      ),
      // --- Rest of page ---//
      GoRoute(
        path: infoSub,
        builder: (context, state) => const InfoSubscription(),
      ),
      GoRoute(
        path: setting,

        builder: (context, state) {
          final user = state.extra as UserModel;
          return SettingPage(user: user);
        },
      ),
    ],
  );
}
