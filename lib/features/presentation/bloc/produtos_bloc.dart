import 'package:bloc/bloc.dart';
import 'package:cafeteria_app/features/domain/entities/error.dart';
import 'package:cafeteria_app/features/domain/entities/produtos_entity.dart';
import 'package:cafeteria_app/features/domain/usecases/lista_produtos/get_lista_produtos.dart';
import 'package:cafeteria_app/features/domain/usecases/lista_produtos/get_lista_produtos_imp.dart';

import 'package:equatable/equatable.dart';

part 'produtos_event.dart';
part 'produtos_state.dart';

final class ProdutosBloc extends Bloc<ProdutosEvent, ProdutosState> {
  late final IGetListaProdutos _getListaProdutos;

  ProdutosBloc() : super(InitialProdutosState()) {
    _getListaProdutos = GetListaProdutosImp();
    on<GetProdutosEvent>(_getProdutos);
  }

  void _getProdutos(GetProdutosEvent event, Emitter<ProdutosState> emit) async {
    try {
      emit(LoadingProdutosState());
      final produtos = await _getListaProdutos.listaProdutos();
      emit(LoadedProdutosState(produtos));
      if (produtos.isEmpty) {
        emit(EmptyProdutosState());
      }
    } on NetworkError {
      emit(const ErrorProdutosState("Falha na conexão"));
    } on CatchError catch (e) {
      emit(ErrorProdutosState(e.message));
    }
  }
}
