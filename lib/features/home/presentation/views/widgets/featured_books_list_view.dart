import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_routers.dart';
import 'custom_book_image.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (BuildContext context, state) {
        if (state is FeaturedBooksSuccessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.28,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      GoRouter.of(context)
                          .push(AppRouters.kBookDetailsView, extra: state.books[index]);
                  },
                  child: CustomBookImage(
                    imageUrl:
                        state.books[index].volumeInfo?.imageLinks?.thumbnail ??
                            "",
                  ),
                );
              },
              separatorBuilder: (context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01,
                  ),
                );
              },
              itemCount: state.books.length,
            ),
          );
        } else if (state is FeaturedBooksFailureState) {
          return CustomErrorWidget(errorMessage: state.message);
        } else {
          //loading
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
