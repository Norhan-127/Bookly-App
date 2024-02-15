import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/models/Book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/views/SplashView.dart';

abstract class AppRouters {
  static const kSplash = '/';
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  // static const kSearchView = '/kSearchView';

  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: kSplash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: kBookDetailsView,
      builder: (context, state) => BlocProvider(
        create: (context) => SimilarBooksCubit(
          getIt.get<HomeRepoImpl>(),
        ),
        child:  BookDetailsView(bookModel: state.extra as BookModel),
      ),
    ),
    // GoRoute(
    //   path: kSearchView,
    //   builder: (context, state) => const SearchView(),
    // ),
  ]);
}
