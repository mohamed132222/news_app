import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/api/dio/dio_manager.dart';
import 'package:news_app/feature/search/presentation/view_model/search_state.dart';

class SearchViewModel extends Cubit<SearchState> {
  SearchViewModel() : super(SearchLoadingState());

  getNewsWithSearch(String query) async {
    try {
      emit(SearchLoadingState());
      var response = await DioManager.getNewsBySearch(query);
      if (response.status == "error") {
        //todo=> error(server)
        emit(SearchErrorState(errorMessage: response.message));
      } else {
        //todo=> success
        emit(SearchSuccessState(newsList: response.articles));
      }
    } catch (e) {
      //todo => error(client)
      emit(SearchErrorState(errorMessage: e.toString()));
    }
  }
}
