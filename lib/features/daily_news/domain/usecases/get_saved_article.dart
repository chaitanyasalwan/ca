import 'package:ca/core/resources/data_state.dart';
import 'package:ca/core/usecases/usecase.dart';
import 'package:ca/features/daily_news/domain/entities/articles.dart';
import 'package:ca/features/daily_news/domain/repositories/article_repository.dart';

class GetSavedArticleUseCase
    implements UseCase<List<ArticleEntity>, void> {
  final ArticleRepository _articleRepository;
  GetSavedArticleUseCase(this._articleRepository);
  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
}
