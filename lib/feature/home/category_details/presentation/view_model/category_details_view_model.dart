import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/feature/home/category_details/data/repository/sources/source_repository/source_repository.dart';
import 'package:news_app/feature/home/category_details/presentation/view_model/category_details_state.dart';

class CategoryDetailsViewModel extends Cubit<CategoryDetailsState> {
  SourceRepository sourceRepository;

  CategoryDetailsViewModel({required this.sourceRepository})
    : super(CategoryDetailsLoadingState());

  getSources(String categoryId) async {
    try {
      emit(CategoryDetailsLoadingState());
      var response = await sourceRepository.getSource(categoryId);
      if (response.status == "error") {
        //todo=> error(server)
        emit(CategoryDetailsErrorState(errorMessage: response.message));
      } else {
        //todo=> success
        emit(CategoryDetailsSuccessState(sourcesList: response.sources));
      }
    } catch (e) {
      //todo => error(client)
      emit(CategoryDetailsErrorState(errorMessage: e.toString()));
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:news_app/core/api/dio/dio_manager.dart';
//
// import '../view/source/data/model/source_response.dart';
//
// class CategoryDetailsViewModel extends ChangeNotifier {
//   List<Source>? sourcesList;
//
//   String? errorMessage;
//   getSource(String categoryId) async {
//     sourcesList = null;
//     errorMessage = null;
//     notifyListeners();
//     try {
//       var response = await DioManager.getSources(categoryId);
//       if (response.status == "error") {
//         //todo server=>error
//         errorMessage = response.message;
//       } else {
//         //todo server=>ok
//         sourcesList = response.sources;
//       }
//     } catch (e) {
//       //todo client=>error
//       errorMessage = e.toString();
//     }
//     notifyListeners();
//   }
// }
