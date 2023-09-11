import 'package:cafeteria_app/features/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

class Rotas {
  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const HomePageView(),
      ),
    ],
  );

  get rotas => _router;
}
