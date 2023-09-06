import 'package:bloc/bloc.dart';
import 'package:cafeteria_app/repository/abstracts/i_lista_produtos_repository.dart';
import 'package:cafeteria_app/repository/lista_produtos_repository_imp.dart';
import 'package:equatable/equatable.dart';

import '../../models/error.dart';
import '../../models/produtos_model.dart';

part 'produtos_event.dart';
part 'produtos_state.dart';

final class ProdutosBloc extends Bloc<ProdutosEvent, ProdutosState> {
  final IListaProdutosRepository _listaProdutosRepository =
      ListaProdutosRepository();
  ProdutosBloc() : super(InitialProdutosState()) {
    on<GetProdutosEvent>(_getProdutos);
  }

  void _getProdutos(GetProdutosEvent event, Emitter<ProdutosState> emit) async {
    try {
      emit(LoadingProdutosState());

      final produtos = await _listaProdutosRepository.listaProdutos();

      emit(LoadedProdutosState(produtos));

      if (produtos.isEmpty) {
        emit(EmptyProdutosState());
      }
    } on NetworkError {
      emit(const ErrorProdutosState("Falha na conexão"));
    } catch (e) {
      emit(ErrorProdutosState(e.toString()));
    }
  }
}
