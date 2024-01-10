import 'package:bside_todolist/board/board_detail_screen.dart';
import 'package:bside_todolist/board/board_opinion_screen.dart';
import 'package:bside_todolist/common/components/bottom_nav_bar.dart';
import 'package:bside_todolist/common/components/ui/system/texts.dart';
import 'package:bside_todolist/common/components/ui/button.dart';
import 'package:bside_todolist/common/components/ui/system/colors.dart';
import 'package:bside_todolist/common/provider/auth_provider.dart';
import 'package:bside_todolist/questions/create/questions_create_screen.dart';
import 'package:bside_todolist/profile/edit/profile_edit_screen.dart';
import 'package:bside_todolist/quiz/quiz_create_screen.dart';
import 'package:bside_todolist/screen/board_screen.dart';
import 'package:bside_todolist/screen/cunning_document_scanner_screen.dart';
import 'package:bside_todolist/screen/landing_screen.dart';
import 'package:bside_todolist/login/login_screen.dart';
import 'package:bside_todolist/home/home_screen.dart';
import 'package:bside_todolist/profile/profile_screen.dart';
import 'package:bside_todolist/screen/quiz_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart' as provider;
import 'package:riverpod_annotation/riverpod_annotation.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsFlutterBinding.ensureInitialized();

  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: dotenv.env['KAKAO_APP_KEY'],
  );

// Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

// Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(
    provider.MultiProvider(
      providers: [
        provider.ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider()),
      ],
      child: ProviderScope(
        child: MyApp(camera: firstCamera),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  MyApp({super.key, required this.camera});

  final _navigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

  GoRouter _router(camera) {
    return GoRouter(
      navigatorKey: _navigatorKey,
      initialLocation: '/landing',
      routes: <RouteBase>[
        GoRoute(
            path: '/landing',
            builder: (context, state) => const LandingScreen()),
        GoRoute(
            path: '/login', builder: (conext, state) => const LoginScreen()),
        ShellRoute(
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: child,
                bottomNavigationBar: ScaffoldWithNavBar(child: child),
              ),
            );
          },
          routes: [
            GoRoute(
              path: '/questions',
              builder: (context, state) => const HomeScreen(),
              routes: [
                ShellRoute(
                  parentNavigatorKey: _navigatorKey,
                  builder: (BuildContext context, GoRouterState state,
                      Widget child) {
                    return child;
                  },
                  routes: [
                    GoRoute(
                      path: 'create',
                      builder: (context, state) {
                        return const QuestionsCreateScreen();
                      },
                    ),
                  ],
                ),
              ],
            ),
            GoRoute(
              path: '/folders',
              builder: (context, state) => const QuizScreen(),
              routes: [
                ShellRoute(
                  parentNavigatorKey: _navigatorKey,
                  builder: (BuildContext context, GoRouterState state,
                      Widget child) {
                    return SafeArea(
                      child: Scaffold(
                        appBar: AppBar(
                          leading: IconButton(
                            icon: const Icon(Icons.chevron_left),
                            onPressed: () {
                              context.pop();
                            },
                          ),
                          title: const Text('퀴즈 만들기'),
                          centerTitle: true,
                        ),
                        resizeToAvoidBottomInset: false,
                        body: child,
                        bottomNavigationBar: null,
                      ),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: 'create',
                      builder: (
                        context,
                        state,
                      ) {
                        return const QuizCreateScreen();
                      },
                    ),
                  ],
                ),
              ],
            ),
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfileScreen(),
              routes: [
                ShellRoute(
                  parentNavigatorKey: _navigatorKey,
                  builder: (BuildContext context, GoRouterState state,
                      Widget child) {
                    return child;
                  },
                  routes: [
                    GoRoute(
                      path: 'edit',
                      builder: (
                        context,
                        state,
                      ) {
                        return const ProfileEditScreen();
                      },
                    ),
                  ],
                ),
              ],
            ),
            GoRoute(
              path: '/board',
              builder: (context, state) => const BoardScreen(),
              routes: [
                ShellRoute(
                  parentNavigatorKey: _navigatorKey,
                  builder: (BuildContext context, GoRouterState state,
                      Widget child) {
                    return SafeArea(
                      child: Scaffold(
                        appBar: AppBar(
                          leading: IconButton(
                            icon: const Icon(Icons.chevron_left),
                            onPressed: () {
                              context.pop();
                            },
                          ),
                          title: const Text(
                            '의견남기기',
                            style: MyTexts.KR17700,
                          ),
                          centerTitle: true,
                        ),
                        resizeToAvoidBottomInset: false,
                        body: child,
                        bottomNavigationBar: null,
                      ),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: 'opinion',
                      builder: (
                        context,
                        state,
                      ) {
                        return const BoardOpinionScreen();
                      },
                    ),
                    GoRoute(
                      path: 'detail',
                      builder: (
                        context,
                        state,
                      ) {
                        return const BoardDetailScreen();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'bside8',
      routerConfig: _router(camera),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Apple SD Gothic Neo',
        fontFamilyFallback: const ['SF Pro Text'],
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
