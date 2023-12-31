import 'package:diary/ui/screens/account/account_screen.dart';
import 'package:diary/ui/screens/diary/add_diary_screen.dart';
import 'package:diary/ui/screens/diary/detail_answer_screen.dart';
import 'package:diary/ui/screens/diary/detail_diary_screen.dart';
import 'package:diary/ui/screens/diary/success_diary_screen.dart';
import 'package:diary/ui/screens/home/home_screen.dart';
import 'package:diary/ui/screens/splash/spash_screen.dart';
import 'package:diary/ui/vm/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routerProvider = Provider(
  (ref) {
    final authViewModel = ref.watch(authViewModelProvider);

    return GoRouter(
      redirect: authViewModel.redirect,
      refreshListenable: authViewModel,
      initialLocation: "/splash",
      routes: [
        GoRoute(
          path: "/",
          name: "home_screen",
          builder: (_, __) => const HomeScreen(),
        ),
        GoRoute(
          path: "/diary/add",
          name: "diary_add_screen",
          builder: (_, __) => const AddDiaryScreen(),
        ),
        GoRoute(
          path: "/diary/success",
          name: "diary_success_screen",
          builder: (_, __) => const SuccessDiaryScreen(),
        ),
        GoRoute(
          path: "/diary/answer",
          name: "diary_answer_screen",
          builder: (_, __) => const DetailAnswerScreen(),
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const DetailAnswerScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            );
          },
        ),
        GoRoute(
          path: "/diary/:id",
          name: "diary_detail_screen",
          builder: (_, state) => DetailDiaryScreen(
            id: state.pathParameters['id']!,
          ),
        ),
        GoRoute(
          path: "/account",
          name: "account_screen",
          builder: (_, __) => const AccountScreen(),
        ),
        GoRoute(
          path: "/splash",
          name: "splash_screen",
          builder: (_, __) => const SplashScreen(),
        ),
      ],
    );
  },
);
