import 'package:go_router/go_router.dart';

import 'package:cafeteria_app/features/domain/entities/usuario_carrinho_entity.dart';
import 'package:cafeteria_app/features/presentation/pages/carrinho/carrinho_page.dart';
import 'package:cafeteria_app/features/presentation/pages/enderecos/enderecos_page.dart';
import 'package:cafeteria_app/features/presentation/pages/home_page.dart';
import 'package:cafeteria_app/features/presentation/pages/login/login_page.dart';
import 'package:cafeteria_app/features/presentation/pages/pedidos/pedidos_page.dart';
import 'package:cafeteria_app/features/presentation/pages/produtos/produtos_page.dart';

class Rotas {
  final _router = GoRouter(
    initialLocation: '/produtos',
    routes: [
      ShellRoute(
        builder: (context, state, child) => HomePageView(
          child: child,
        ),
        routes: [
          GoRoute(
            path: "/produtos",
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const ProdutosPage(),
              transitionDuration: Duration.zero,
              transitionsBuilder: (_, __, ___, child) => child,
            ),
          ),
          GoRoute(
            path: "/carrinho",
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const CarrinhoPage(),
              transitionDuration: Duration.zero,
              transitionsBuilder: (_, __, ___, child) => child,
            ),
          ),
          GoRoute(
            path: "/usuario",
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const LoginPage(),
              transitionDuration: Duration.zero,
              transitionsBuilder: (_, __, ___, child) => child,
            ),
          ),
          GoRoute(
            path: "/pedidos",
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const PedidosPage(),
              transitionDuration: Duration.zero,
              transitionsBuilder: (_, __, ___, child) => child,
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/enderecos',
        name: 'enderecos',
        builder: (context, state) => EnderecosPage(
            finalizarCarrinho: state.extra as List<UsuarioCarrinhoEntity>),
      ),
    ],
  );

  get rotas => _router;
}
