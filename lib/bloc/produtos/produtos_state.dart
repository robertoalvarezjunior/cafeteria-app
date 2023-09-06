part of 'produtos_bloc.dart';

sealed class ProdutosState extends Equatable {
  const ProdutosState();

  @override
  List<Object?> get props => [];
}

final class InitialProdutosState extends ProdutosState {}

final class EmptyProdutosState extends ProdutosState {}

final class LoadingProdutosState extends ProdutosState {}

final class ErrorProdutosState extends ProdutosState {
  final String message;

  const ErrorProdutosState(this.message);
}

final class LoadedProdutosState extends ProdutosState {
  final List<ProdutosModel> produtos;
  const LoadedProdutosState(this.produtos);
}
