import 'package:bside_todolist/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var auth = context.watch<AuthProvider>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/login.json'),
            ElevatedButton(
              onPressed: () async {
                var kakaoUser = await auth.kakaoLogin();

                if (kakaoUser != null) {
                  context.go('/problems');
                }
              },
              child: const Text('카카오 로그인'),
            )
          ],
        ),
      ),
    );
  }
}
