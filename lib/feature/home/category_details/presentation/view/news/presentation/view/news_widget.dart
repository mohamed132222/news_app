import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../core/di/di.dart';

import '../../../source/data/model/source_response.dart';
import '../view_model/news_view_model.dart';
import 'NewsViewBody.dart';

class NewsWidget extends StatelessWidget {
  final Source source;

  const NewsWidget({required this.source});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: ValueKey(source.id),
      create: (_) =>
          NewsViewModel(newsRepository: newsRepositoryInject())
            ..getNews(source.id ?? ""),
      child: NewsViewBody(source: source),
    );
  }
}
