import 'package:bloc/bloc.dart';
import 'package:ifsctoolkit/search_event.dart';
import 'package:ifsctoolkit/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState.initial());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchQueryChanged) {
      yield* mapQueryChanged(event.searchQuery);
    } else if (event is SearchClickedEvent) {
      yield* mapSearchClicked();
    }
  }

  Stream<SearchState> mapQueryChanged(String searchQuery) async* {
    yield state.onSearchQueryUpdate(searchQuery: searchQuery);
  }

  Stream<SearchState> mapSearchClicked() async* {
    yield state..searchQuery;
  }
}
