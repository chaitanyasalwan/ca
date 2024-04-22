import 'dart:io';

import 'package:ca/core/constants/constant.dart';
import 'package:ca/core/resources/data_state.dart';
import 'package:ca/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:ca/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:ca/features/daily_news/data/models/article.dart';
import 'package:ca/features/daily_news/domain/entities/articles.dart';

import 'package:ca/features/daily_news/domain/repositories/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final AppDatabase _appDatabase;
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService, this._appDatabase);
  @override
  Future<DataState<List<ArticleModel>>> getNewsArcticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsApiKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print(httpResponse.data.length);
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioErrorType.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleModel>> getSavedArticles() {
    return _appDatabase.articleDAO.getArticles();
  }

  @override
  Future<void> removedArticle(ArticleEntity article) {
    return _appDatabase.articleDAO.deleteArticle(ArticleModel.fromEntity(article));

  }

  @override
  Future<void> saveArticles(ArticleEntity article) {
      return _appDatabase.articleDAO.insertArticle(ArticleModel.fromEntity(article));
  }
}
