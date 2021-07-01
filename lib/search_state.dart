class SearchState {
  late String _searchQuery;

  SearchState._();

  factory SearchState.initial() {
    return SearchState._().._searchQuery = "";
  }
}
