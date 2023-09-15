import 'package:bloc/bloc.dart';
import 'package:cafeteria_app/features/domain/entities/error.dart';
import 'package:cafeteria_app/features/domain/entities/produtos_entity.dart';
import 'package:cafeteria_app/features/domain/usecases/lista_produtos/get_lista_produtos.dart';
import 'package:cafeteria_app/features/domain/usecases/lista_produtos/get_lista_produtos_imp.dart';

import 'package:equatable/equatable.dart';

part 'produtos_event.dart';
part 'produtos_state.dart';

sealed class IProdutosBloc extends Bloc<IProdutosEvent, IProdutosState> {
  late final IGetListaProdutos _getListaProdutos;

  IProdutosBloc(super.initialState) {
    _getListaProdutos = GetListaProdutosImp();
    on<GetProdutosEvent>(_getProdutos);
  }

  void _getProdutos(GetProdutosEvent event, Emitter<IProdutosState> emit);
}

final class ProdutosBloc extends IProdutosBloc {
  ProdutosBloc() : super(InitialProdutosState());

  @override
  void _getProdutos(
      GetProdutosEvent event, Emitter<IProdutosState> emit) async {
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
