part of 'search_bloc.dart';

@immutable
abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchResult extends SearchEvent{
 final String searchKey;
 final BuildContext context;

  const SearchResult(this.searchKey, this.context);

  @override
  List<Object> get props => [];


}