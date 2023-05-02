import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../Home/View/home_screen.dart';
import '../Login/View/login_screen.dart';
import '../Profile/View/profile_screen.dart';
import '../SignUp/View/sign_up.dart';
import '../nav.dart';


final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => LoginScreen(),
      routes: <GoRoute>[
        GoRoute(
          path: 'nav/:selectedIndex',
          name: 'nav',
          builder: (context, state) => Nav(
            selectedIndex: int.parse(state.params["selectedIndex"]!),
          ),
        ),
        GoRoute(
          path: 'profile_screen',
          builder: (BuildContext context, GoRouterState state) => ProfilePage(),
        ),
        GoRoute(
          path: 'sign_up',
          builder: (BuildContext context, GoRouterState state) => SignupPage(),
        ),
        GoRoute(
          //path: 'path1',
          path: 'SignupPage',
          name: 'SignupPage',
          builder: (BuildContext context, GoRouterState state) =>
                SignupPage(),
        ),
      ],
    ),
  ],
);
