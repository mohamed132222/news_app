//todo sourceView=>SourceViewModel
//todo sourceViewModel=>SourceRepository
//todo sourceRepository=>SourceRemoteDataSource
//todo SourceRemoteDataSource=>DioManager

import 'package:news_app/core/api/dio/dio_manager.dart';
import 'package:news_app/feature/home/category_details/data/repository/news/news_repository/news_repository.dart';
import 'package:news_app/feature/home/category_details/data/repository/sources/source_data_source/remote/source_remote_data_source.dart';
import 'package:news_app/feature/home/category_details/data/repository/sources/source_repository/impl/source_repository_impl.dart';
import 'package:news_app/feature/home/category_details/data/repository/sources/source_repository/source_repository.dart';
import 'package:news_app/feature/search/data/repository/search_news/search_news_data_source/remote/impl/search_news_data_source_impl.dart';
import 'package:news_app/feature/search/data/repository/search_news/search_news_data_source/remote/search_news_data_source.dart';
import 'package:news_app/feature/search/data/repository/search_news/search_news_repository/impl/search_news_repository_impl.dart';
import 'package:news_app/feature/search/data/repository/search_news/search_news_repository/search_news_repository.dart';

import '../../feature/home/category_details/data/repository/news/news_data_source/remote/impl/news_remote_data_source_impl.dart';
import '../../feature/home/category_details/data/repository/news/news_data_source/remote/news_remote_data_source.dart';
import '../../feature/home/category_details/data/repository/news/news_repository/impl/news_repository_impl.dart';
import '../../feature/home/category_details/data/repository/sources/source_data_source/remote/impl/source_remote_data_source_impl.dart';

SourceRepository sourceRepositoryInject() {
  return SourceRepositoryImpl(
    sourceRemoteDataSource: sourceRemoteDataSourceInject(),
  );
}

SourceRemoteDataSource sourceRemoteDataSourceInject() {
  return SourceRemoteDataSourceImpl(dioManager: DioManager.getInstance());
}

//todo newsView=>newsViewModel
//todo newsViewModel=>newsRepository
//todo newsRepository=>newsRemoteDataSource
//todo newsRemoteDataSource=>DioManager
NewsRepository newsRepositoryInject() {
  return NewsRepositoryImpl(newsRemoteDataSource: newsRemoteDataSourceInject());
}

NewsRemoteDataSource newsRemoteDataSourceInject() {
  return NewsRemoteDataSourceImpl(dioManager: DioManager.getInstance());
}

//todo searchView=>searchViewModel
//todo searchViewModel=>searchRepository
//todo searchRepository=>searchRemoteDataSource
//todo searchRemoteDataSource=>DioManager
SearchNewsRepository searchNewsRepositoryInject() {
  return SearchNewsRepositoryImpl(
    searchNewsDataSource: searchNewsDataSourceInject(),
  );
}

SearchNewsDataSource searchNewsDataSourceInject() {
  return SearchNewsDataSourceImpl(dioManager: DioManager.getInstance());
}
