import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/feature/home/category_details/presentation/view/source/presentation/view/source_widget.dart';
import 'package:news_app/feature/home/category_details/presentation/view_model/category_details_state.dart';
import 'package:news_app/feature/home/category_details/presentation/view_model/category_details_view_model.dart';
import 'package:news_app/feature/home/category_fragment/data/model/category.dart';
import '../../../../../core/widget/main_error_widget.dart';
import '../../../../../core/widget/main_loading_widget.dart';

class CategoryDetailsScreen extends StatefulWidget {
  static const String routeName = "/category_details_screen";
  Category category;

  CategoryDetailsScreen({required this.category});

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: CategoryDetailsViewModel()..getSources(widget.category.id),
      builder: (context, state) {
        if (state is CategoryDetailsLoadingState) {
          return MainLoadingWidget();
        } else if (state is CategoryDetailsErrorState) {
          return MainErrorWidget(
            errorMessage: state.errorMessage ?? "",
            onPressed: () =>
                CategoryDetailsViewModel()..getSources(widget.category.id),
          );
        } else if (state is CategoryDetailsSuccessState) {
          return SourceWidget(sourcesList: state.sourcesList!);
        }
        return Container();
      },
    );
  }
}

//FutureBuilder(
//   future: DioManager.getSources(widget.category.id),
//   builder: (context, snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return MainLoadingWidget();
//     } else if (snapshot.hasError) {
//       return MainErrorWidget(
//         errorMessage: "there is something went wrong",
//         onPressed: () {
//           DioManager.getSources(widget.category.id);
//           setState(() {});
//         },
//       );
//     } else if (snapshot.data?.status != "ok") {
//       return MainErrorWidget(
//         errorMessage: snapshot.data!.message!,
//         onPressed: () {
//           DioManager.getSources(widget.category.id);
//           setState(() {});
//         },
//       );
//     }
//     var sourceList = snapshot.data?.sources ?? [];
//     return SourceWidget(sourcesList: sourceList);
//   },
// );

//   ChangeNotifierProvider(
//   create: (context) =>
//       CategoryDetailsViewModel()..getSource(widget.category.id),
//   child: Consumer<CategoryDetailsViewModel>(
//     builder: (context, value, child) {
//       if (value.errorMessage != null) {
//         return MainErrorWidget(
//           errorMessage: value.errorMessage!,
//           onPressed: () => value.getSource(widget.category.id),
//         );
//       } else if (value.sourcesList == null) {
//         return MainLoadingWidget();
//       } else {
//         return SourceWidget(sourcesList: value.sourcesList!);
//       }
//     },
//   ),
// );
