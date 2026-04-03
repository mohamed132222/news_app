import 'package:flutter_bloc/flutter_bloc.dart';
import 'search_state.dart';
import '../../data/repository/search_news/search_news_repository/search_news_repository.dart';

class SearchViewModel extends Cubit<SearchState> {
  final SearchNewsRepository searchNewsRepository;

  SearchViewModel({required this.searchNewsRepository})
    : super(SearchState(newsList: []));

  int page = 1;
  final int pageSize = 10;

  bool isFetching = false;

  Future<void> getNewsWithSearch(String query) async {
    if (isFetching) return;

    isFetching = true;

    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final response = await searchNewsRepository.getNewsWithSearch(
        query,
        page: page.toString(),
        pageSize: pageSize.toString(),
      );

      if (response.status == "error") {
        emit(state.copyWith(isLoading: false, errorMessage: response.message));
        return;
      }

      final newList = response.articles ?? [];

      emit(
        state.copyWith(
          newsList: newList,
          isLoading: false,
          hasMore: newList.length == pageSize,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }

    isFetching = false;
  }

  Future<void> loadMore(String query) async {
    if (isFetching || !state.hasMore) return;

    isFetching = true;

    emit(state.copyWith(isLoadingMore: true));

    try {
      page++;

      final response = await searchNewsRepository.getNewsWithSearch(
        query,
        page: page.toString(),
        pageSize: pageSize.toString(),
      );

      final newList = response.articles ?? [];

      emit(
        state.copyWith(
          newsList: [...state.newsList, ...newList],
          isLoadingMore: false,
          hasMore: newList.length == pageSize,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoadingMore: false, errorMessage: e.toString()));
    }

    isFetching = false;
  }

  void reset(String query) {
    page = 1;

    emit(SearchState(newsList: []));

    getNewsWithSearch(query);
  }
}
