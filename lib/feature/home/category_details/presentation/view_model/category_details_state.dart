import '../view/source/data/model/source_response.dart';

abstract class CategoryDetailsState {}

class CategoryDetailsLoadingState extends CategoryDetailsState {}

class CategoryDetailsErrorState extends CategoryDetailsState {
  String? errorMessage;

  CategoryDetailsErrorState({required this.errorMessage});
}

class CategoryDetailsSuccessState extends CategoryDetailsState {
  List<Source>? sourcesList;

  CategoryDetailsSuccessState({required this.sourcesList});
}
