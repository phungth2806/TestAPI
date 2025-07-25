import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/pages/home/feature_page.dart';
import 'package:test/pages/home/login_page.dart';
import 'package:test/pages/home/studentlist_page.dart';

class RouterCustom {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
          name: 'login',
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginPage();
          }),
      GoRoute(
          name: 'studentList',
          path: '/studentList',
          builder: (BuildContext context, GoRouterState state) {
            return const StudentListScreen();
          },
          routes: <GoRoute>[
            GoRoute(
                name: 'feature',
                path: 'feature',
                builder: (BuildContext context, GoRouterState state) {
                  return const HomeScreen();
                })
          ]),
    ],
  );
}
