import 'package:ca/core/resources/data_state.dart';
import 'package:ca/core/usecases/usecase.dart';
import 'package:ca/features/daily_news/domain/entities/articles.dart';
import 'package:ca/features/daily_news/domain/repositories/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;
  GetArticleUseCase(this._articleRepository);
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArcticles();
  }
}
