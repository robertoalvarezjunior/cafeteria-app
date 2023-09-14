part of 'produtos_bloc.dart';

sealed class IProdutosEvent extends Equatable {
  const IProdutosEvent();
  @override
  List<Object?> get props => [];
}

final class GetProdutosEvent extends IProdutosEvent {}
