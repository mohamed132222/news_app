import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/feature/home/category_details/data/repository/news/news_data_source/remote/impl/news_remote_data_source_impl.dart';
import 'package:news_app/feature/home/category_details/data/repository/news/news_data_source/remote/news_remote_data_source.dart';
import 'package:news_app/feature/home/category_details/data/repository/news/news_repository/impl/news_repository_impl.dart';
import 'package:news_app/feature/home/category_details/data/repository/news/news_repository/news_repository.dart';
import 'package:news_app/feature/home/category_details/presentation/view/news/presentation/view_model/news_state.dart';
import '../../../../../../../../core/api/dio/dio_manager.dart';

class NewsViewModel extends Cubit<NewsState> {
  NewsRepository newsRepository;

  NewsViewModel({required this.newsRepository}) : super(NewsLoadingState());

  getNews(String sourceId) async {
    try {
      emit(NewsLoadingState());
      var response = await newsRepository.getNews(sourceId);
      if (response.status == "error") {
        //todo=> error(server)
        emit(NewsErrorState(errorMessage: response.message));
      }
      if (response.articles == null || response.articles!.isEmpty) {
        emit(NewsEmptyState());
      } else {
        //todo=> success
        emit(NewsSuccessState(newsList: response.articles));
      }
    } catch (e) {
      //todo => error(client)
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:news_app/core/api/dio/dio_manager.dart';
//
// import '../../data/model/news_response.dart';
//
// class NewsViewModel extends ChangeNotifier {
//   List<News>? newsList;
//   String? errorMessage;
//   getNews(String sourceId) async {
//     newsList = null;
//     errorMessage = null;
//     notifyListeners();
//     try {
//       var response = await DioManager.getNews(sourceId);
//       if (response.status == "error") {
//         //todo server=>error
//         errorMessage = response.message;
//       } else {
//         //todo server=>ok
//         newsList = response.articles;
//       }
//     } catch (e) {
//       //todo client=>error
//       errorMessage = e.toString();
//     }
//     notifyListeners();
//   }
// }
