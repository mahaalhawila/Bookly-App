import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled2/core/utils/service_locator.dart';
import '../../features/home/presentation/manger/similar_books/similar_books_cubit.dart';
import '../../features/home/presentation/views/book_details.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../models/book_model/book_model.dart';
import '../models/repos/home_repo_impl.dart';

abstract class AppRouter{

  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) =>  SearchView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
            create: (context)=>SimilarBooksCubit(
                getIt.get<HomeRepoImpl>()
            ),
            child:  BookDetailsView(
              bookModel: state.extra as BookModel,
            )),
      ),
    ],
  );
}