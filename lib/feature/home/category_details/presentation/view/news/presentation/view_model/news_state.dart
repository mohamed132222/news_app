import '../../data/model/news_response.dart';

abstract class NewsState {}

class NewsLoadingState extends NewsState {}

class NewsErrorState extends NewsState {
  String? errorMessage;

  NewsErrorState({required this.errorMessage});
}

class NewsEmptyState extends NewsState {}

class NewsSuccessState extends NewsState {
  List<News>? newsList;

  NewsSuccessState({required this.newsList});
}
