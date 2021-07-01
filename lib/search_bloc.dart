import 'package:bloc/bloc.dart';
import 'package:ifsctoolkit/search_event.dart';
import 'package:ifsctoolkit/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(SearchState initialState) : super(initialState);

  @override
  SearchState get initialState => SearchState.initial();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    // TODO: implement mapEventToState
    if(event is SearchClickedEvent) {

    }
    throw UnimplementedError();
  }
}
