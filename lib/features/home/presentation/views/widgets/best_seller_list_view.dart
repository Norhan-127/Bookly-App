import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/newest_books_cubit/newest_books_state.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (BuildContext context, state) {
        if (state is NewestBooksSuccessState) {
          print("first state success");
          return ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.01,
                    horizontal: MediaQuery.of(context).size.width * 0.04),
                child:
                    BestSellerListViewItem(bookModel: state.newestBooks[index]),
              );
            },
            itemCount: state.newestBooks.length,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
          );
        } else if (state is NewestBooksFailureState) {
          print("second state failure");
          return CustomErrorWidget(errorMessage: state.message);
        } else if(state is NewestBooksLoadingState){
          print("loading state ");
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }else {
          return const SizedBox();
        }
      },
    );
  }
}
