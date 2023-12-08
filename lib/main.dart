import 'package:bside_todolist/components/bottom_nav_bar.dart';
import 'package:bside_todolist/provider/auth_provider.dart';
import 'package:bside_todolist/screen/cunning_document_scanner_screen.dart';
import 'package:bside_todolist/screen/landing_screen.dart';
import 'package:bside_todolist/screen/history_screen.dart';
import 'package:bside_todolist/screen/login_screen.dart';
import 'package:bside_todolist/screen/home.dart';
import 'package:bside_todolist/screen/profile_screen.dart';
import 'package:bside_todolist/screen/quiz_screen.dart';
import 'package:bside_todolist/screen/photo_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthProvider>(create: (context) => AuthProvider()),
    ],
    child: MyApp(camera: firstCamera),
  ));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  MyApp({super.key, required this.camera});

  GoRouter _router(camera) {
    return GoRouter(
      initialLocation: '/landing',
      routes: <RouteBase>[
        GoRoute(path: '/landing', builder: (context, state) => LandingScreen()),
        GoRoute(path: '/login', builder: (conext, state) => LoginScreen()),
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
                path: '/problems',
                builder: (context, state) => HomeScreen(),
              ),
              GoRoute(
                path: '/quiz',
                builder: (context, state) => QuizScreen(),
              ),
              GoRoute(
                  path: '/upload',
                  builder: (context, state) {
                    return CunningDocumentScannerScreen();
                  }),
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
        fontFamilyFallback: ['SF Pro Text'],
        textTheme: TextTheme(
          headline1: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
