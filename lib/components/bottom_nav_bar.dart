import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.child,
    super.key,
  });

  final Widget child;

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/problems')) {
      return 0;
    }
    if (location.startsWith('/quiz')) {
      return 1;
    }
    if (location.startsWith('/upload')) {
      return 2;
    }
    if (location.startsWith('/profile')) {
      return 3;
    }
    if (location.startsWith('/history')) {
      return 4;
    }

    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/problems');
        break;
      case 1:
        GoRouter.of(context).go('/quiz');
        break;
      case 2:
        GoRouter.of(context).go('/upload');
        break;
      case 3:
        GoRouter.of(context).go('/profile');
        break;
      case 4:
        GoRouter.of(context).go('/history');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.green.shade600,
      unselectedItemColor: Colors.grey.shade600,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book),
          label: '내 문제',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.quiz),
          label: '퀴즈 풀기',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_enhance),
          label: '카메라',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '내 정보',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: '히스토리',
        ),
      ],
      currentIndex: _calculateSelectedIndex(context),
      onTap: (int idx) => _onItemTapped(idx, context),
    );
  }
}
