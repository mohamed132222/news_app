import 'package:news_app/feature/home/category_details/presentation/view/news/data/model/news_response.dart';

abstract class SearchState {}

class SearchLoadingState extends SearchState {}

class SearchErrorState extends SearchState {
  String? errorMessage;

  SearchErrorState({required this.errorMessage});
}

class SearchSuccessState extends SearchState {
  List<News>? newsList;

  SearchSuccessState({required this.newsList});
}
