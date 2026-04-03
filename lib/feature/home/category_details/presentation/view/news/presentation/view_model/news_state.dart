import 'package:news_app/feature/home/category_details/presentation/view/news/data/model/news_response.dart';

class NewsState {
  final List<News> newsList;
  final bool isLoading;
  final bool isLoadingMore;
  final String? errorMessage;
  final bool hasMore;

  NewsState({
    required this.newsList,
    this.isLoading = false,
    this.isLoadingMore = false,
    this.errorMessage,
    this.hasMore = true,
  });

  NewsState copyWith({
    List<News>? newsList,
    bool? isLoading,
    bool? isLoadingMore,
    String? errorMessage,
    bool? hasMore,
  }) {
    return NewsState(
      newsList: newsList ?? this.newsList,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      errorMessage: errorMessage,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}
