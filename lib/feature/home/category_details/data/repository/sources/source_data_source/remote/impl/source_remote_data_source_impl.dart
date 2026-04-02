import 'package:news_app/core/api/dio/dio_manager.dart';
import 'package:news_app/core/api/http/api_manager.dart';
import 'package:news_app/feature/home/category_details/presentation/view/source/data/model/source_response.dart';

import '../source_remote_data_source.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource {
  //todo=>get data from Server with dio
  DioManager dioManager;

  SourceRemoteDataSourceImpl({required this.dioManager});

  @override
  Future<SourceResponse> getSource(String categoryid) async {
    var response = await dioManager.getSources(categoryid);
    return response;
  }
}

class SourceRemoteDataSourceImpl1 implements SourceRemoteDataSource {
  ApiManager apiManager;

  SourceRemoteDataSourceImpl1({required this.apiManager});

  @override
  Future<SourceResponse> getSource(String categoryid) async {
    var response = await apiManager.getSources(categoryid);
    return response;
  }
}
