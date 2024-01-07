import 'package:bside_todolist/common/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var authProvider = Provider.of<AuthProvider>(context, listen: false);

      User? kakaoUser = await authProvider.kakaoCheckUser();

      if (kakaoUser != null) {
        try {
          await authProvider.starLogin();

          context.go('/questions');
        } catch (error) {
          context.go('/login');
        }
      } else {
        context.go('/questions');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/splash.json'),
      ),
    );
  }
}
