import 'package:flutter/material.dart';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cafeteria_app/config/routes/rotas.dart';
import 'package:cafeteria_app/core/local_storage/usuario_infos_bloc.dart';
import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/presentation/bloc/produtos/produtos_bloc.dart';
import 'package:cafeteria_app/features/presentation/bloc/usuario/usuario_bloc.dart';

void main() {
  getItSetup();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final IUsuarioInfosBloc _usuarioInfosBloc = UsuarioInfosBloc();
  final ProdutosBloc _produtosBloc = ProdutosBloc();

  @override
  void initState() {
    _usuarioInfosBloc.add(const GetUsuarioInfosEvent());
    _produtosBloc.add(GetProdutosEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => _usuarioInfosBloc),
        BlocProvider(create: (context) => _produtosBloc),
        BlocProvider(create: (context) => getIt<IUsuarioInfosBloc>()),
        BlocProvider(create: (context) => getIt<IUsuarioBloc>()),
      ],
      child: MaterialApp.router(
        routerConfig: Rotas().rotas,
        title: 'Cafeteria',
        theme: FlexThemeData.light(
          scheme: FlexScheme.orangeM3,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          blendLevel: 7,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 10,
            blendOnColors: false,
            useTextTheme: true,
            useM2StyleDividerInM3: true,
            alignedDropdown: true,
            useInputDecoratorThemeInDialogs: true,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          swapLegacyOnMaterial3: true,
        ),
        darkTheme: FlexThemeData.dark(
          scheme: FlexScheme.orangeM3,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          blendLevel: 13,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 20,
            useTextTheme: true,
            useM2StyleDividerInM3: true,
            alignedDropdown: true,
            useInputDecoratorThemeInDialogs: true,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          swapLegacyOnMaterial3: true,
        ),
        themeMode: ThemeMode.system,
      ),
    );
  }
}
