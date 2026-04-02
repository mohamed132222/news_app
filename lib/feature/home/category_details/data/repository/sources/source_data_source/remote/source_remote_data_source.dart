import 'package:news_app/feature/home/category_details/presentation/view/source/data/model/source_response.dart';

abstract class SourceRemoteDataSource {
  Future<SourceResponse> getSource(String categoryid);
}
