part of 'produtos_bloc.dart';

sealed class IProdutosState extends Equatable {
  const IProdutosState();

  @override
  List<Object?> get props => [];
}

final class InitialProdutosState extends IProdutosState {}

final class EmptyProdutosState extends IProdutosState {}

final class LoadingProdutosState extends IProdutosState {}

final class ErrorProdutosState extends IProdutosState {
  final String message;

  const ErrorProdutosState(this.message);
}

final class LoadedProdutosState extends IProdutosState {
  final List<ProdutosEntity> produtos;
  const LoadedProdutosState(this.produtos);
}
