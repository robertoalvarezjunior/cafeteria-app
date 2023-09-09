part of 'produtos_bloc.dart';

sealed class ProdutosEvent extends Equatable {
  const ProdutosEvent();
  @override
  List<Object?> get props => [];
}

final class GetProdutosEvent extends ProdutosEvent {}
