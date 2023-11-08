import 'package:bside_todolist/components/bottom_nav_bar.dart';
import 'package:bside_todolist/screen/landing_screen.dart';
import 'package:bside_todolist/screen/history_screen.dart';
import 'package:bside_todolist/screen/login_screen.dart';
import 'package:bside_todolist/screen/problems_screen.dart';
import 'package:bside_todolist/screen/profile_screen.dart';
import 'package:bside_todolist/screen/quiz_screen.dart';
import 'package:bside_todolist/screen/upload_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:go_router/go_router.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsFlutterBinding.ensureInitialized();

  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: dotenv.env['KAKAO_APP_KEY'],
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    initialLocation: '/problems',
    routes: <RouteBase>[
      GoRoute(path: '/landing', builder: (context, state) => LandingScreen()),
      GoRoute(path: '/login', builder: (conext, state) => LoginScreen()),
      ShellRoute(
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return Scaffold(
              body: child,
              bottomNavigationBar: ScaffoldWithNavBar(child: child),
            );
          },
          routes: [
            GoRoute(
              path: '/problems',
              builder: (context, state) => ProblemsScreen(),
            ),
            GoRoute(
              path: '/quiz',
              builder: (context, state) => QuizScreen(),
            ),
            GoRoute(
              path: '/upload',
              builder: (context, state) => UploadScreen(),
            ),
            GoRoute(
              path: '/profile',
              builder: (context, state) => ProfileScreen(),
            ),
            GoRoute(
              path: '/history',
              builder: (context, state) => HistoryScreen(),
            ),
          ])
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'bside8',
      routerConfig: _router,
    );
  }
}
