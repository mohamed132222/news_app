import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../data/repository/news/news_repository/news_repository.dart';
import 'news_state.dart';

class NewsViewModel extends Cubit<NewsState> {
  final NewsRepository newsRepository;

  NewsViewModel({required this.newsRepository})
    : super(NewsState(newsList: []));

  int page = 1;
  final int pageSize = 10;

  bool isFetching = false;

  Future<void> getNews(String sourceId) async {
    if (isFetching) return;

    isFetching = true;

    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final response = await newsRepository.getNews(
        sourceId,
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

  Future<void> loadMore(String sourceId) async {
    if (isFetching || !state.hasMore) return;

    isFetching = true;

    emit(state.copyWith(isLoadingMore: true));

    try {
      page++;

      final response = await newsRepository.getNews(
        sourceId,
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

  void reset(String sourceId) {
    page = 1;

    emit(NewsState(newsList: []));

    getNews(sourceId);
  }
}
