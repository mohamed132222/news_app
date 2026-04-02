import 'package:news_app/feature/home/category_details/data/repository/sources/source_data_source/remote/source_remote_data_source.dart';
import 'package:news_app/feature/home/category_details/presentation/view/source/data/model/source_response.dart';

import '../source_repository.dart';

class SourceRepositoryImpl implements SourceRepository {
  SourceRemoteDataSource sourceRemoteDataSource;

  SourceRepositoryImpl({required this.sourceRemoteDataSource});

  @override
  Future<SourceResponse> getSource(String categoryid) {
    return sourceRemoteDataSource.getSource(categoryid);
  }
}
