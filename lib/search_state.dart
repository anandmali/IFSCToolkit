class SearchState {
  final String searchQuery;

  SearchState({
    required this.searchQuery,
  });

  factory SearchState.initial() {
    return SearchState(
      searchQuery: "",
    );
  }

  SearchState onSearchQueryUpdate({
    required String searchQuery,
  }) {
    return SearchState(
      searchQuery: searchQuery,
    );
  }
}
