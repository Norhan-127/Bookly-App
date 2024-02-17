import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/search/presentaion%20/views/widgets/build_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants.dart';
import '../../../../core/utils/api_service.dart';
import '../../data/repos/search_repo_impl.dart';
import '../manager/search_books_cubit/search_books_cubit.dart';

class BookSearchView extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear_sharp),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_ios_new));
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBooksCubit(
        SearchRepoImpl(
          getIt.get<ApiService>(),
        ),
      )..fetchSearchedItem(query: query),
      child: BuildResults(query: query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // return (query == "" || query == null)
    //     ? const Center(
    //         child: Text(
    //         "No data",
    //         style: Styles.textStyle16,
    //       ))
    //     : BlocProvider(
    //         create: (context) => SearchBooksCubit(
    //           SearchRepoImpl(
    //             getIt.get<ApiService>(),
    //           ),
    //         )..fetchSearchedItem(query: query),
    //         child: BuildResults(query: query),
    //       );
    return const Center();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        appBarTheme: AppBarTheme(
      color: kPrimaryColor,
      toolbarTextStyle: searchFieldStyle,
    ));
  }
}
