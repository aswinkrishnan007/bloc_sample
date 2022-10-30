part of 'search_bloc.dart';

@immutable
abstract class SearchState extends Equatable{
   const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}
class SearchLoading extends SearchState {}
class SearchLoaded extends SearchState {

  final SearchModel searchmodel;

  const SearchLoaded(this.searchmodel);
   @override
  List<Object> get props => [searchmodel];
}
class SearchError extends SearchState {
  final String? error;

  const SearchError(this.error);
  
}
