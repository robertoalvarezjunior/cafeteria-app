import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: child),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_rounded),
            label: '',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (value) => _onItemTapped(value, context),
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/produtos')) {
      return 0;
    }
    if (location.startsWith('/carrinho')) {
      return 1;
    }
    if (location.startsWith('/usuario')) {
      return 2;
    }
    if (location.startsWith('/pedidos')) {
      return 3;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/produtos');
        break;
      case 1:
        GoRouter.of(context).go('/carrinho');
        break;
      case 2:
        GoRouter.of(context).go('/usuario');
        break;
      case 3:
        GoRouter.of(context).go('/pedidos');
        break;
    }
  }
}
