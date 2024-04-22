import 'package:ca/config/routes/routes.dart';
import 'package:ca/config/theme/app_theme.dart';
import 'package:ca/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:ca/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:ca/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:ca/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await intializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(), 
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home:const DailyNews(),
      ),
    );
  }
}
