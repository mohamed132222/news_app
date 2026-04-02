import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/api/dio/dio_manager.dart';
import 'package:news_app/feature/search/presentation/view_model/search_state.dart';

import '../../data/repository/search_news/search_news_data_source/remote/impl/search_news_data_source_impl.dart';
import '../../data/repository/search_news/search_news_data_source/remote/search_news_data_source.dart';
import '../../data/repository/search_news/search_news_repository/impl/search_news_repository_impl.dart';
import '../../data/repository/search_news/search_news_repository/search_news_repository.dart';

class SearchViewModel extends Cubit<SearchState> {
  late SearchNewsRepository searchNewsRepository;

  SearchViewModel({required this.searchNewsRepository})
    : super(SearchLoadingState());

  getNewsWithSearch(String query) async {
    try {
      emit(SearchLoadingState());
      var response = await searchNewsRepository.getNewsWithSearch(query);
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
