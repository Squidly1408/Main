// packages
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// pages / models
import 'pages/home.dart';
import '../auth/login.dart';
import '../pages/error_page.dart';
import 'pages/other_projects.dart';
import 'pages/outlearning.dart';
import 'pages/projects/project1.dart';
import 'pages/projects/project2.dart';
import 'pages/projects/project3.dart';
import 'pages/projects/project4.dart';
import 'pages/projects/project5.dart';
import 'pages/projects/project6.dart';
import 'pages/projects/senior_project.dart';

void main() async {
  runApp(const MyApp());
}

// colour scheming
Color mainColour = const Color(0xff03767b);
Color mainColour2 = const Color(0xff10d0d6);

Color secondaryColour = const Color(0xff171717);
Color secondaryColour2 = const Color(0xffa6a6a6);
Color secondaryColour3 = const Color(0xffffffff);

// spare assest for switching to light mode
Color secondaryColorS = secondaryColour;

themeChange() {
  secondaryColour3 = secondaryColorS;
  secondaryColour = secondaryColour3;
  secondaryColorS = secondaryColour;
}

// routing - by go router - need to make work
final GoRouter _router = GoRouter(
  errorBuilder: (context, state) {
    return ErrorPage(
      error: state.uri.toString(),
    );
  },
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
      routes: [
        GoRoute(
          path: 'login',
          builder: (context, state) => const Login(),
        ),
        GoRoute(
          path: 'outlearning',
          builder: (context, state) => const Outlearning(),
        ),
        GoRoute(
          path: 'other-projects',
          builder: (context, state) => const OtherProjectsPage(),
        ),
        GoRoute(
          path: 'projects',
          builder: (context, state) => const OtherProjectsPage(),
          routes: [
            GoRoute(
              path: 'comnu',
              name: 'Squidly1408 - Projects - Comnu',
              builder: (context, state) => const Project1(),
            ),
            GoRoute(
              path: 'auslan-glove',
              name: 'Squidly1408 - Projects - Auslan Glove',
              builder: (context, state) => const Project2(),
            ),
            GoRoute(
              path: 'luvium',
              name: 'Squidly1408 - Projects - Luvium',
              builder: (context, state) => const Project3(),
            ),
            GoRoute(
              path: 'strocoge',
              name: 'Squidly1408 - Projects - Strocoge',
              builder: (context, state) => const Project4(),
            ),
            GoRoute(
              path: 'portfolio',
              name: 'Squidly1408 - Projects - Portfolio',
              builder: (context, state) => const Project5(),
            ),
            GoRoute(
              path: 'project-6',
              name: 'Squidly1408 - Projects - Project 6',
              builder: (context, state) => const Project6(),
              redirect: (context, state) => 'projects',
            ),
            GoRoute(
              path: 'senior-project',
              name: 'Squidly1408 - Projects - Senior Project',
              builder: (context, state) => const SeniorProject(),
            ),
          ],
        ),
      ],
    ),
  ],
);

// my app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Squidly1408',
      debugShowCheckedModeBanner: false,

      // theming
      theme: ThemeData(
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStatePropertyAll(mainColour),
        ),
      ),
    );
  }
}
