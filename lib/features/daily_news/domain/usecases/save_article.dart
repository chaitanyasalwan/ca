import 'package:ca/core/resources/data_state.dart';
import 'package:ca/core/usecases/usecase.dart';
import 'package:ca/features/daily_news/domain/entities/articles.dart';
import 'package:ca/features/daily_news/domain/repositories/article_repository.dart';

class SaveArticleUseCase
    implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;
  SaveArticleUseCase(this._articleRepository);
  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.saveArticles(params!);
  }
}
