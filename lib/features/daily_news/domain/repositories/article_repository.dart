import 'package:ca/core/resources/data_state.dart';
import 'package:ca/features/daily_news/domain/entities/articles.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArcticles();
  Future<List<ArticleEntity>> getSavedArticles();
  Future<void> saveArticles(ArticleEntity article);
  Future<void> removedArticle(ArticleEntity article);
}
