abstract class SearchEvent {}

class SearchClickedEvent extends SearchEvent {
  SearchClickedEvent();
}

class SearchQueryChanged extends SearchEvent {
  String searchQuery;

  SearchQueryChanged({required this.searchQuery});
}
