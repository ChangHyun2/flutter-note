import 'package:bside_todolist/provider/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var authProvider = context.watch<AuthProvider>();

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            authProvider.kakaoUser == null
                ? Text('')
                : Text(authProvider.kakaoUser!.id.toString()),
            ElevatedButton(
              onPressed: () {
                authProvider.kakaoLogout().then((_) {
                  context.go('/login');
                });
              },
              child: Text('logout'),
            )
          ],
        ),
      ),
    );
  }
}
