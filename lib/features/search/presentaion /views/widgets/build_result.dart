import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_routers.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../home/presentation/views/widgets/book_rating_row.dart';
import '../../../../home/presentation/views/widgets/custom_book_image.dart';
import '../../manager/search_books_cubit/search_books_cubit.dart';

class BuildResults extends StatefulWidget {
  const BuildResults({super.key, required this.query});

  final String query;


  @override
  State<BuildResults> createState() => _BuildResultsState();
}

class _BuildResultsState extends State<BuildResults> {
  @override
  void initState() {
    super.initState();
    if (widget.query.isNotEmpty) {
      Future.delayed(
        Duration.zero,
        () async {
          await BlocProvider.of<SearchBooksCubit>(context)
              .fetchSearchedItem(query: widget.query);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksInitial) {
          return const CustomLoadingIndicator();
        } else if (state is SearchBooksSuccess) {
          print("SUCCESS STATE  ${state.books.length}");
          if (state.books.isEmpty) {
            return const Center(
              child: Text(
                "No search results found",
                style: Styles.textStyle18,
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final book = state.books[index];
                    print("Building item $index");
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.145,
                          child: CustomBookImage(
                            imageUrl:
                                book.volumeInfo?.imageLinks?.thumbnail ?? "",
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.6,
                                child: Text(
                                  book.volumeInfo?.title ?? "dddd",
                                  style: Styles.textStyle20
                                      .copyWith(fontFamily: kGtSectraFine),
                                  maxLines: 2,
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                book.volumeInfo?.authors?[0] ?? "?",
                                style: Styles.textStyle14
                                    .copyWith(color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Free',
                                    style: Styles.textStyle20.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  BookRatingRow(
                                    rating: state.books[index].volumeInfo
                                            ?.ratingsCount ??
                                        1,
                                    count: state.books[index].volumeInfo
                                            ?.ratingsCount ??
                                        2,
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.grey,
                      thickness: 1, // Specify the thickness of the line
                      height: 20, // Specify the height of the line
                    );
                  },
                  itemCount: state.books.length),
            );
          }
        } else if (state is SearchBooksFailure) {
          print("FAILURE STATE");
          return Center(child: CustomErrorWidget(errorMessage: state.message));
        } else if (state is SearchBooksLoading) {
          print("LOADING STATE");
          return const CustomLoadingIndicator();
        } else {
          print("NOT STATE");
          return const SizedBox();
        }
      },
    );
  }
}
