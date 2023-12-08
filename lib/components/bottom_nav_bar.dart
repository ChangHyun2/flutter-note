import 'package:bside_todolist/design_system/colors.dart';
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.08),
            blurRadius: 10,
          ),
        ],
      ),
      child: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: MyColors.starGreen,
        unselectedItemColor: MyColors.gray500,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: '오답노트',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_enhance),
            label: '문제등록',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '내정보',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }
}
